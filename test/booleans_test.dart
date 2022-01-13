import 'package:pouch/pouch.dart' as pouch;
import 'package:test/test.dart';

void main() {
  test('isFalse() is true if the value is false', () {
    expect(pouch.isFalse(null), isFalse);
    expect(pouch.isFalse(true), isFalse);
    expect(pouch.isFalse(false), isTrue);
  });

  test('isTrue() is true if the value is true', () {
    expect(pouch.isTrue(null), isFalse);
    expect(pouch.isTrue(false), isFalse);
    expect(pouch.isTrue(true), isTrue);
  });
}
