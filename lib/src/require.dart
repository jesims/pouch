import 'bool_extensions.dart';

/// Util for checking
/// `since 0.7.0`
class Require {
  Require._();

  /// Throws an exception with [message] if [check] is [false]
  /// `since 0.7.0`
  static void require(bool check, String message) {
    if (check.isFalse) {
      throw Exception(message);
    }
  }
}
