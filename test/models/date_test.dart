import 'package:pouch/pouch.dart';
import 'package:test/test.dart';

void main() {
  var throwsAnAssertionError = throwsA(isA<AssertionError>());

  group('Date', () {
    test('attributes', () {
      var actual = Date(year: 2022, month: 06, day: 12);

      expect(actual.year, equals(2022));
      expect(actual.month, equals(06));
      expect(actual.day, equals(12));
    });

    test('equality', () {
      var left = Date(year: 2022, month: 5, day: 22);
      var right = Date(year: 2022, month: 5, day: 22);
      var nextYear = Date(year: 2023, month: 5, day: 22);

      expect(left, equals(right));
      expect(left, isNot(equals(nextYear)));
    });

    test('assertions', () {
      expect(
        () => Date(year: 2022, month: 02, day: 30),
        throwsAnAssertionError,
      );
      expect(
        () => Date(year: 2022, month: 13, day: 12),
        throwsAnAssertionError,
      );

      expect(
        () => Date(year: -1, month: 01, day: 12),
        throwsAnAssertionError,
      );
    });
  });
}
