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
}
