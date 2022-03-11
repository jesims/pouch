import 'package:pouch/pouch.dart' as pouch;
import 'package:test/test.dart';

void main() {
  test('isNull() is true if the value is null', () {
    expect(null.isNull, isTrue);
    String? s;
    expect(s.isNull, isTrue);
  });

  test('isNull() is false if the value is not null', () {
    String? s;
    s = '123 some string';
    expect(s.isNull, isFalse);
  });
}
