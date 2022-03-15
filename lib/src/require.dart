import 'bool_extensions.dart';

/// Default implementation of [RequireException] which carries a message.
///
/// `since 0.7.0`
class RequireException implements Exception {
  /// A message describing the require error.
  ///
  /// `since 0.7.0`
  final String message;

  /// Constructs a new instance of the [RequireException]
  ///
  /// `since 0.7.0`
  RequireException(this.message);
}

/// Util for checking
///
/// `since 0.7.0`
class Require {
  Require._();

  /// Throws an [RequireException] with [message] if [check] is `false`
  ///
  /// `since 0.7.0`
  static bool require(bool check, String message) {
    if (check.isFalse) {
      throw RequireException(message);
    }
    return check;
  }
}
