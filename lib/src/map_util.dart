import 'objects.dart';

/// Useful Map extensions
class MapUtil {
  MapUtil._();

  /// Removes entries where the value is `null` from the provided [map]
  static Map<dynamic, dynamic> removeNullValues(Map<dynamic, dynamic> map) {
    return Map.fromEntries(
      map.entries.where(
        (entry) => isNotNull(entry.value),
      ),
    );
  }
}

/// Useful Map extensions
extension MapExtentions on Map {
  /// Removes entries where the value is `null`
  Map removeNullValues() {
    return MapUtil.removeNullValues(this);
  }
}
