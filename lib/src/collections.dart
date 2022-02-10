import 'booleans.dart';

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
