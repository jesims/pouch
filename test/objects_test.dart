import 'package:pouch/pouch.dart' as pouch;
import 'package:test/test.dart';

void main() {
  test('isNull() is true if the value is null', () {
    String? v;
    expect(pouch.isNull(v), isTrue);
    expect(pouch.isNull('value'), isFalse);
    var x = [];
    expect(pouch.isNull(x), isFalse);
  });

  test('isNotNull() is true if the value is NOT null', () {
    String? v;
    expect(pouch.isNotNull(v), isFalse);
    expect(pouch.isNotNull('value'), isTrue);
    var x = [];
    expect(pouch.isNotNull(x), isTrue);
  });

  test(
      'cast() casts the value to the specified Type if it is an instance of it',
      () {
    var v = '1234';
    expect(pouch.cast<String>(v), equals(v));
    expect(pouch.cast<List>(v), isNull);
    var x = [];
    expect(pouch.cast<String>(x), isNull);
    expect(pouch.cast<List>(x), equals(x));
  });

  test('identity() returns itself', () {
    var expected = Object();

    expect(pouch.identity(expected), equals(expected));
    expect(pouch.identity(null), equals(null));
  });
}
