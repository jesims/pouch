import 'collection_util.dart';
import 'collections.dart' as coll;
import 'objects.dart';

/// Extends [Iterable]s with some common helper properties and functions
///
/// `since 0.0.1`
extension IterableExtensions<E> on Iterable<E> {
  /// Returns the first element from the iterable, or null if the iterable is
  /// empty
  ///
  /// `since 0.0.1`
  E? get firstOrNull {
    return coll.firstOrNull(this);
  }

  /// Returns an [Iterable] consisting of the elements of this iterable,
  /// additionally performing the provided action on each element as elements
  /// are consumed from the resulting iterable
  ///
  /// `since 0.0.1`
  Iterable<E> peek(void Function(E element) fn) {
    forEach(fn);
    return this;
  }

  /// Returns a lazily filtered [Iterable] (via [Iterable.where]) using the
  /// provided [predicate] when the supplied [condition] is `true`. Otherwise
  /// returns the original, un-filtered, [Iterable].
  ///
  /// `since 0.2.0`
  Iterable<E> filterWhen(bool condition, bool Function(E element) predicate) {
    return condition ? where(predicate) : this;
  }

  /// Takes a [path] `List` and returns the value at [path] in a nested collection.
  /// Traverses `Map` (by key), `List` (by index), and `Iterable` (by index) values.
  dynamic getIn(List<dynamic> path) {
    return CollectionUtil.getIn(path, this);
  }
}

/// Extends [Iterable]s of [Iterable]s
///
/// `since 0.0.1`
extension NestedIterableExtensions<E> on Iterable<Iterable<E>> {
  /// Flattens each iterable element of this [Iterable] into zero or more
  /// elements in iteration order.
  ///
  /// `since 0.0.1`
  Iterable<E?> get flatten {
    return expand(identity);
  }
}
