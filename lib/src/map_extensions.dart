import 'bool_extensions.dart';
import 'map_util.dart';
import 'object_extensions.dart';

/// Useful Map extensions
///
/// `since 0.4.0`
extension MapExtentions on Map<dynamic, dynamic> {
  /// Removes entries where the value is `null`
  ///
  /// `since 0.4.0`
  Map<dynamic, dynamic> removeNullValues() {
    return MapUtil.removeNullValues(this);
  }
}

/// Extensions to [Map]?
///
/// `since 1.1.0`
extension NullableMapExensions<K, V> on Map<K, V>? {
  /// Returns `true` if [this] is `null` or empty
  ///
  /// `since 1.1.0`
  bool get isEmpty {
    return isNull || this!.entries.isEmpty;
  }

  /// Returns `true` if [this] is NOT `null` and NOT empty
  ///
  /// `since 1.1.0`
  bool get isNotEmpty {
    return isEmpty.isFalse;
  }
}
