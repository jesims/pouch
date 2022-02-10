import 'collections.dart' as coll;

/// List extensions
extension ListExtensions on List {
  /// Takes a [path] `List` and returns the value at [path] in a nested collection.
  /// Traverses `Map` (by key), `List` (by index), and `Iterable` (by index) values.
  dynamic getIn(List<dynamic> path) {
    return coll.getIn(path, this);
  }
}
