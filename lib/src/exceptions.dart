/// Exception that can be thrown when a key is not found  in a `Map`
class KeyNotFoundException implements Exception {
  /// The message
  final String message;

  /// Takes the [map] and [key] and creates the [message]
  KeyNotFoundException(Map<dynamic, dynamic> map, dynamic key)
      : message = 'Map $map does not contain key: ${Error.safeToString(key)}';

  @override
  String toString() {
    return message;
  }
}
