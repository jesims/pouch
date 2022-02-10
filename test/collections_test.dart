import 'package:pouch/pouch.dart' as pouch;
import 'package:test/test.dart';

void main() {
  test('isEmpty() is true if the list is null or empty', () {
    expect(pouch.isEmpty(null), isTrue);
    expect(pouch.isEmpty(<dynamic>{}), isTrue);
    expect(pouch.isEmpty([]), isTrue);
    expect(pouch.isEmpty({}), isTrue);
    expect(pouch.isEmpty([1]), isFalse);
    expect(pouch.isEmpty(<dynamic>{'key'}), isFalse);
    expect(pouch.isEmpty({'key': 1}), isFalse);
    expect(pouch.isEmpty(''), isTrue);
    expect(pouch.isEmpty('1234'), isFalse);
  });

  test('isNotEmpty() is true if the list is not empty', () {
    expect(pouch.isNotEmpty(null), isFalse);
    expect(pouch.isNotEmpty(<dynamic>{}), isFalse);
    expect(pouch.isNotEmpty([]), isFalse);
    expect(pouch.isNotEmpty({}), isFalse);
    expect(pouch.isNotEmpty([1]), isTrue);
    expect(pouch.isNotEmpty(<dynamic>{'key'}), isTrue);
    expect(pouch.isNotEmpty({'key': 1}), isTrue);
    expect(pouch.isNotEmpty(''), isFalse);
    expect(pouch.isNotEmpty('1234'), isTrue);
  });
}
