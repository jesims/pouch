import 'package:pouch/pouch.dart';
import 'package:test/test.dart';

void main() {
  var throwsAnAssertionError = throwsA(isA<AssertionError>());

  group('Time', () {
    test('attributes', () {
      var actual = const Time(hour: 07, minute: 42);

      expect(actual.hour, equals(7));
      expect(actual.minute, equals(42));
    });

    test('equality', () {
      var left = const Time(hour: 12, minute: 15);
      var right = const Time(hour: 12, minute: 15);
      var afterMidnight = const Time(hour: 0, minute: 15);

      expect(left, equals(right));
      expect(left, isNot(equals(afterMidnight)));
    });

    test('assertions', () {
      expect(() => Time(hour: -1, minute: 30), throwsAnAssertionError);
      expect(() => Time(hour: 24, minute: 30), throwsAnAssertionError);
      expect(() => Time(hour: 23, minute: -1), throwsAnAssertionError);
      expect(() => Time(hour: 23, minute: 60), throwsAnAssertionError);
    });
  });
}
