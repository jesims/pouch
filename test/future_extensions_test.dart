import 'package:pouch/pouch.dart';
import 'package:test/test.dart';

void main() {
  group('FutureBoolExtensions', () {
    group('isFalse', () {
      test('returns true when value is false', () async {
        expect(await Future.value(false).isFalse, true);
      });
      test('returns false when value is not false', () async {
        expect(await Future.value(true).isFalse, false);
      });
    });
  });
}
