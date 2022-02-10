import 'collection_util.dart';

/// List extensions
extension ListExtensions on List {
  /// Takes a [path] `List` and returns the value at [path] in a nested collection.
  /// Traverses `Map` (by key), `List` (by index), and `Iterable` (by index) values.
  dynamic getIn(List<dynamic> path) {
    return CollectionUtil.getIn(path, this);
  }
}
