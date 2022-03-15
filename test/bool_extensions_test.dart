import 'package:pouch/pouch.dart';
import 'package:test/test.dart';

void main() {
  group('BoolExtensions', () {
    group('isFalse', () {
      test('returns true when value is false', () {
        expect(false.isFalse, true);
      });
      test('returns false when value is not false', () {
        expect(true.isFalse, false);
      });
    });
  });
}
