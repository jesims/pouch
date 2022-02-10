import 'collection_util.dart';
import 'map_util.dart';

/// Useful Map extensions
extension MapExtentions on Map {
  /// Removes entries where the value is `null`
  Map removeNullValues() {
    return MapUtil.removeNullValues(this);
  }

  /// Takes a [path] `List` and returns the value at [path] in a nested collection.
  /// Traverses `Map` (by key), `List` (by index), and `Iterable` (by index) values.
  dynamic getIn(List<dynamic> path) {
    return CollectionUtil.getIn(path, this);
  }
}
