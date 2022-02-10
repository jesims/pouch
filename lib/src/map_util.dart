import 'objects.dart';

//TODO why is this in a class with a Util suffix when that is not the convention in the rest of the library
/// Useful Map extensions
class MapUtil {
  MapUtil._();

  /// Removes entries where the value is `null` from the provided [map]
  static Map<dynamic, dynamic> removeNullValues(Map<dynamic, dynamic> map) {
    return Map.fromEntries(
      map.entries.where((entry) => isNotNull(entry.value)),
    );
  }
}
