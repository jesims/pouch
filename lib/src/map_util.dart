import 'objects.dart';

/// Useful Map extensions
class MapUtil {
  MapUtil._();

  /// Removes entries where the value is `null` from the provided [map]
  ///
  /// `since 0.4.0`
  static Map<dynamic, dynamic> removeNullValues(Map<dynamic, dynamic> map) {
    return Map.fromEntries(
      map.entries.where((entry) => isNotNull(entry.value)),
    );
  }
}
