// TODO move into a util class https://github.com/jesims/docs/blob/master/Coding-Conventions/Dart.md#utilities

/// Returns the first element from the [coll]; or `null` if the the [coll] is
/// empty
///
/// `since 0.0.1`
E? firstOrNull<E>(Iterable<E> coll) {
  var it = coll.iterator;
  return it.moveNext() ? it.current : null;
}
