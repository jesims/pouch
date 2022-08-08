import 'dart:async';
import 'package:mocktail/mocktail.dart';
import 'package:pouch/pouch.dart';
import 'package:test/test.dart';

class MockClock extends Mock implements Clock {}

void main() {
  group(PollingWaiter, () {
    group('constructor', () {
      group('defaults', () {
        var actual = PollingWaiter();

        test('timeout to 30 seconds', () {
          expect(actual.timeout, const Duration(seconds: 30));
        });

        test('interval to 100 milliseconds', () {
          expect(actual.interval, const Duration(milliseconds: 100));
        });

        test('clock to $DartClock', () {
          expect(actual.clock, isA<DartClock>());
        });
      });

      test('overrides', () {
        var expectedInterval = const Duration(seconds: 1);
        var expectedTimeout = const Duration(seconds: 2);
        var mockClock = MockClock();

        var actual = PollingWaiter(
          timeout: expectedTimeout,
          interval: expectedInterval,
          clock: mockClock,
        );

        expect(actual.timeout, expectedTimeout);
        expect(actual.interval, expectedInterval);
        expect(actual.clock, mockClock);

        verifyNoMoreInteractions(mockClock);
      });
    });

    group('until', () {
      var duration = const Duration(milliseconds: 1);
      var mockClock = MockClock();

      var delayCallCount = 0;

      var waiter = PollingWaiter(
        timeout: duration,
        interval: duration,
        clock: mockClock,
      );

      waiter.delay = (Duration actual) {
        expect(actual, duration);
        delayCallCount++;
        return Future.value(null);
      };

      setUp(() => delayCallCount = 0);

      test('does not wait if isFinished is already finished', () async {
        when(() => mockClock.millisecondsSinceEpoch()).thenReturn(0);

        await waiter.until('Already True', () => true);

        expect(delayCallCount, 0);
        verify(() => mockClock.millisecondsSinceEpoch());
      });

      test('waits until a timeout occurs', () async {
        var millis = [10, 1, 2, 3]; // First answer is the determine the timeout
        when(() => mockClock.millisecondsSinceEpoch())
            .thenAnswer((_) => millis.removeAt(0));

        await waiter.until('Until Empty', () => millis.isEmpty);

        expect(delayCallCount, 3);
        verify(() => mockClock.millisecondsSinceEpoch()).called(4);
      });

      test('throws a TimeoutException', () async {
        var millis = [0, 1, 2]; // First answer is the determine the timeout
        when(() => mockClock.millisecondsSinceEpoch())
            .thenAnswer((_) => millis.removeAt(0));

        expect(
          () async => await waiter.until('Already passed', () => false),
          throwsA(
            isA<TimeoutException>().having(
              (e) => e.message,
              'message',
              'Waiting for Already passed',
            ),
          ),
        );
        expect(delayCallCount, 0);
      });
    });
  });
}
