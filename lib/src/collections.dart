import 'booleans.dart';
import 'exceptions.dart';

/// Returns `true` if the provided [Iterable], [Map], or [String], is not `null`
/// and [Iterable.isNotEmpty]
///
/// `since 0.0.1`
bool isNotEmpty(dynamic coll) {
  return (coll is Map && coll.isNotEmpty) ||
      (coll is Iterable && coll.isNotEmpty) ||
      (coll is String && coll.isNotEmpty);
}

/// Returns `true` if the provided [Iterable] or [Map] is `null` or
/// [Iterable.isEmpty]
///
/// `since 0.0.1`
bool isEmpty(dynamic coll) => isFalse(isNotEmpty(coll));

/// Returns the first element from the [coll]; or `null` if the the [coll] is
/// empty
///
/// `since 0.0.1`
E? firstOrNull<E>(Iterable<E> coll) {
  var it = coll.iterator;
  return it.moveNext() ? it.current : null;
}

/// Returns the value at [path] in a nested collection.
/// Takes a [path] `List` and a collection [coll].
/// Traverses `Map` (by key), `List` (by index), and `Iterable` (by index) values.
dynamic getIn(List<dynamic> path, dynamic coll) {
  return path.fold(coll, (prev, e) {
    if (prev != null) {
      if (prev is Map && prev.isNotEmpty) {
        if (isFalse(prev.containsKey(e))) {
          throw KeyNotFoundException(prev, e);
        }
        return prev[e];
      }
      if (prev is List && prev.isNotEmpty) {
        return prev[e];
      }
      if (prev is Iterable && prev.isNotEmpty) {
        return prev.elementAt(int.parse(e));
      }
    }
    return null;
  });
}
