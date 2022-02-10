import 'booleans.dart';
import 'exceptions.dart';

/// Utilities for collection classes (`Iterable` and `Map`)
class CollectionUtil {
  CollectionUtil._();

  /// Returns the value at [path] in a nested collection.
  /// Takes a [path] `List` and a collection [coll].
  /// Traverses `Map` (by key), `List` (by index), and `Iterable` (by index) values.
  static dynamic getIn(List<dynamic> path, dynamic coll) {
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
          return prev.elementAt(e);
        }
      }
      return null;
    });
  }
}
