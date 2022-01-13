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
    var it = iterator;
    return it.moveNext() ? it.current : null;
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
