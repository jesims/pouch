import 'package:pouch/src/collection_util.dart';
import 'package:pouch/src/exceptions.dart';
import 'package:test/test.dart';

void main() {
  group('CollectionUtil', () {
    group('getIn()', () {
      test('returns the value at path', () {
        expect(CollectionUtil.getIn([1], [0, 1, 2]), equals(1));
        {
          var path = [1, 1];
          var coll = [
            0,
            [4, 5, 6],
            2
          ];
          expect(CollectionUtil.getIn(path, coll), equals(5));
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
          expect(CollectionUtil.getIn(path, coll), equals('b'));
        }
      });
      test('errors if key is not found', () {
        expect(
          () => CollectionUtil.getIn([0], {1: 1}),
          throwsA(isA<KeyNotFoundException>()),
        );
      });
      test('errors if index is outside range', () {
        expect(
          () => CollectionUtil.getIn([2], [0, 1]),
          throwsA(isA<RangeError>()),
        );
      });
      test('errors if index is not an int', () {
        expect(
          () {
            CollectionUtil.getIn(['a'], [0]);
          },
          throwsA(isA<TypeError>()),
        );
      });
      test('returns null if collection is empty', () {
        expect(CollectionUtil.getIn([1], []), isNull);
        expect(CollectionUtil.getIn([1], {}), isNull);
        expect(CollectionUtil.getIn([0, 0], [{}]), isNull);
      });
      test('returns null if `coll` is not a collection', () {
        expect(CollectionUtil.getIn([1], 1), isNull);
        expect(CollectionUtil.getIn([1], '1'), isNull);
        expect(CollectionUtil.getIn([0, 0], [0]), isNull);
      });
    });
  });
}
