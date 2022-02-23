import 'package:pouch/pouch.dart' as pouch;
import 'package:test/test.dart';

void main() {
  test('firstOrNull', () {
    expect([].firstOrNull, equals(null));
    expect([1].firstOrNull, equals(1));
    expect([2, 3, 1].firstOrNull, equals(2));
    var expected = 'a';
    expect([expected, 'b'].firstOrNull, equals(expected));
  });

  test('peek', () {
    var collection = [8, 2, 3, 1];
    var peeked = [];
    expect(collection.peek(pouch.identity), equals(collection));
    expect(collection.peek((e) => peeked.add(e)), equals(collection));
  });

  test('flatten', () {
    var collection1 = ['a', 'b'];
    var collection2 = [1, 2];

    Iterable<Object?> actual = [collection1].flatten;
    expect(actual, equals(collection1));

    actual = [collection1, collection2].flatten;
    expect(actual, isNot(equals(collection1)));
    expect(actual, equals(['a', 'b', 1, 2]));

    actual = [collection2, collection1].flatten;
    expect(actual, equals([1, 2, 'a', 'b']));
  });

  group('partition', () {
    test('empty return empty iterable', () {
      var coll = [];

      var actual = coll.partition(2);

      // Note: Not identical
      expect(actual, equals(coll));
    });

    test('equal number of items', () {
      var coll = [0, 1, 2, 3, 4, 5];

      var actual = coll.partition(2);

      expect(
        actual,
        equals([
          [0, 1],
          [2, 3],
          [4, 5]
        ]),
      );
    });

    test('unequal number of items', () {
      var coll = [0, 1, 2];

      var actual = coll.partition(2);

      expect(
        actual,
        equals([
          [0, 1],
          [2]
        ]),
      );
    });
  });

  group('filterWhen', () {
    test('condition is false', () {
      var coll = [1, 2, 3, 4, 5];

      var actual = coll.filterWhen(false, (element) => false);
      expect(identical(actual, coll), isTrue);
    });

    test('condition is true', () {
      var coll = [1, 2, 3, 4, 5];

      var actual = coll.filterWhen(true, (element) => element.isEven);
      expect(actual, equals([2, 4]));
    });
  });
}
