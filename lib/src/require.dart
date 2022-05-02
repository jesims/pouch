import 'bool_extensions.dart';
import 'string_extensions.dart';
import 'strings.dart';

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

  @override
  String toString() {
    return 'RequireException: $message';
  }
}

/// Util for checking
///
/// `since 0.7.0`
class Require {
  Require._();

  /// Throws a [RequireException] with [message] if [check] is `false`
  ///
  /// `since 0.7.0`
  static void require(bool check, String message) {
    if (check.isFalse) {
      throw RequireException(message);
    }
  }

  /// Throws a [RequireException] if [string] is blank.
  /// See [StringUtil.isBlank]
  ///
  /// `since 0.7.0`
  static String notBlank(String? string) {
    Require.require(string.isNotBlank, 'String is blank');
    return string!;
  }
}
