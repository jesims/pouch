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

  group('getIn()', () {
    test('returns the value at path', () {
      expect(pouch.getIn([1], [0, 1, 2]), equals(1));
      {
        var path = [1, 1];
        var coll = [
          0,
          [4, 5, 6],
          2
        ];
        expect(pouch.getIn(path, coll), equals(5));
      }
      {
        var path = [1, 1, 'b'];
        var coll = [
          0,
          [
            4,
            {'a': 'a', 'b': 'b'},
            6
          ],
          2
        ];
        expect(pouch.getIn(path, coll), equals('b'));
      }
    });
    test('errors if key is not found', () {
      expect(
        () => pouch.getIn([0], {1: 1}),
        throwsA(isA<pouch.KeyNotFoundException>()),
      );
    });
    test('errors if index is outside range', () {
      expect(
        () => pouch.getIn([2], [0, 1]),
        throwsA(isA<RangeError>()),
      );
    });
    test('errors if index is not an int', () {
      expect(
        () {
          pouch.getIn(['a'], [0]);
        },
        throwsA(isA<TypeError>()),
      );
    });
    test('returns null if collection is empty', () {
      expect(pouch.getIn([1], []), isNull);
      expect(pouch.getIn([1], {}), isNull);
      expect(pouch.getIn([0, 0], [{}]), isNull);
    });
    test('returns null if `coll` is not a collection', () {
      expect(pouch.getIn([1], 1), isNull);
      expect(pouch.getIn([1], '1'), isNull);
      expect(pouch.getIn([0, 0], [0]), isNull);
    });
  });
}
