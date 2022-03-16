/// Exception that can be thrown when a key is not found  in a `Map`
///
/// `since 0.5.0`
class KeyNotFoundException implements Exception {
  /// The message
  final String message;

  /// Takes the [map] and [key] and creates the [message]
  KeyNotFoundException(Map<Object, Object> map, Object key)
      : message = 'Map $map does not contain key: ${Error.safeToString(key)}';

  @override
  String toString() {
    return message;
  }
}
