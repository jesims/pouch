import 'collection_util.dart';
import 'map_util.dart';

/// Useful Map extensions
///
/// `since 0.4.0`
extension MapExtentions on Map {
  /// Removes entries where the value is `null`
  ///
  /// `since 0.4.0`
  Map removeNullValues() {
    return MapUtil.removeNullValues(this);
  }

  /// Takes a [path] `List` and returns the value at [path] in a nested collection.
  /// Traverses `Map` (by key), `List` (by index), and `Iterable` (by index) values.
  ///
  /// `since 0.5.0`
  dynamic getIn(List<dynamic> path) {
    return CollectionUtil.getIn(path, this);
  }
}
