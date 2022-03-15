import 'package:pouch/pouch.dart';
import 'package:test/test.dart';

void main() {
  group('NullableObjectExtensions', () {
    group('isNull', () {
      test('returns true when object is null', () {
        expect(null.isNull, true);
      });
      test('returns false when object is not null', () {
        expect(1.isNull, false);
      });
    });
    group('isNotNull', () {
      test('returns true when object is not null', () {
        expect(1.isNotNull, true);
      });
      test('returns false when object is null', () {
        expect(null.isNotNull, false);
      });
    });
  });
}
