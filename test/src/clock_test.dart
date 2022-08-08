import 'package:mocktail/mocktail.dart';
import 'package:pouch/src/clock.dart';
import 'package:test/test.dart';

class MockDateTime extends Mock implements DateTime {
  DateTime now();
}

void main() {
  group(DartClock, () {
    var mockDateTime = MockDateTime();
    var clock = DartClock(() => mockDateTime.now());

    tearDown(() => verifyNoMoreInteractions(mockDateTime));

    group('millisecondsSinceEpoch', () {
      test('resolves the current milliseconds since epoch', () {
        var now = DateTime.now();
        when(() => mockDateTime.now()).thenAnswer((_) => now);

        var actual = clock.millisecondsSinceEpoch();

        expect(actual, now.millisecondsSinceEpoch);
        verify(() => mockDateTime.now());
      });

      test('changes over time', () {
        var offset = const Duration(milliseconds: 15);
        var first = DateTime.now();
        var second = first.add(offset);
        var answers = [first, second];

        when(() => mockDateTime.now()).thenAnswer((_) => answers.removeAt(0));

        var actualFirst = clock.millisecondsSinceEpoch();
        var actualSecond = clock.millisecondsSinceEpoch();

        expect(actualFirst, lessThan(actualSecond));
        expect(actualFirst, actualSecond - 15);
        verify(() => mockDateTime.now()).called(2);
      });
    });
  });
}
