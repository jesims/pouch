import 'package:collection/collection.dart' as coll_lib;

import 'bool_extensions.dart';
import 'collections.dart' as coll;
import 'object_extensions.dart';
import 'objects.dart';

/// Extends [Iterable]s with some common helper properties and functions
///
/// `since 0.0.1`
extension IterableExtensions<E> on Iterable<E> {
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

  /// Returns an [Iterable] of [Iterable]s of [n] items each without overlap.
  ///
  /// `since 0.6.0`
  Iterable partition(int n) {
    assert(0 < n);
    // TODO Consider making lazy
    return isEmpty ? [] : ([take(n), ...skip(n).partition(n)]);
  }

  /// Groups the elements by the value returned by [key].
  ///
  /// Returns a map from keys computed by [key] to a list of all values for which
  /// [key] returns that key. The values appear in the list in the same relative
  /// order as [this].
  Map<K, List<E>> groupBy<K>(K Function(E) key) {
    return coll_lib.groupBy(this, key);
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
  Iterable<E> get flatten {
    return expand(identity);
  }
}

/// Extends [Iterable] of [Future]s
///
/// `since 0.8.0`
extension FutureIterableExtensions<V> on Iterable<Future<V>> {
  /// Does a [Future.wait] for all values in [this].
  ///
  /// `since 0.8.0`
  Future<List<V>> awaitAll({
    bool eagerError = false,
    void Function(V successValue)? cleanUp,
  }) =>
      Future.wait(this, eagerError: eagerError, cleanUp: cleanUp);
}

/// Extensions to [Iterable]<E>?
///
/// `since 1.1.0`
extension NullableIterableExtensions<E> on Iterable<E>? {
  /// Returns the first element from [this] iterable, or `null` if [this] iterable
  /// is `null` or empty
  ///
  /// `since 0.0.1`
  E? get firstOrNull {
    return this.isNull ? null : coll.firstOrNull(this!);
  }

  /// Returns `true` if [this] is `null` or empty
  ///
  /// `since 1.1.0`
  bool get isEmpty {
    return this.isNull || this!.iterator.moveNext().isFalse;
  }

  /// Returns `true` if [this] is NOT `null` and NOT empty
  ///
  /// `since 1.1.0`
  bool get isNotEmpty {
    return isEmpty.isFalse;
  }
}
