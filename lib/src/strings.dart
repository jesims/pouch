// TODO move into a util class https://github.com/jesims/docs/blob/master/Coding-Conventions/Dart.md#utilities
import 'bool_extensions.dart';
import 'objects.dart';

/// Returns `true` if the provided [String] value [v] is not `null` and is not
/// blank (whitespaces)
///
/// `since 0.0.1`
@Deprecated('Use `StringUtils.isNotBlank`')
bool isNotBlank(String? v) => StringUtil.isNotBlank(v);

/// Returns `true` if the provided [String] value [v] is `null` or blank
/// (whitespace only)
///
/// `since 0.0.1`
@Deprecated('Use `StringUtils.isBlank`')
bool isBlank(String? v) => StringUtil.isBlank(v);

/// Returns `true` if [left] is equal to [right] irrespective of case
///
/// `since 0.1.0`
@Deprecated('Use `StringUtils.equalsIgnoreCase`')
bool equalsIgnoreCase(String? left, String? right) =>
    StringUtil.equalsIgnoreCase(left, right);

/// Returns `true` if [s] contains the [needle] irrespective of case
///
/// `since 0.1.0`
@Deprecated('Use `StringUtils.containsIgnoreCase`')
bool containsIgnoreCase(String? s, String? needle) =>
    StringUtil.containsIgnoreCase(s, needle);

/// String Helper Utilities
class StringUtil {
  StringUtil._();

  /// Returns `true` if the provided [String] value [v] is not `null` and is not
  /// blank (whitespaces)
  ///
  /// `since 1.5.0`
  static bool isNotBlank(String? v) => isBlank(v).isFalse;

  /// Returns `true` if the provided [String] value [v] is `null` or blank
  /// (whitespace only)
  ///
  /// `since 1.5.0`
  // TODO improve performance by checking if every character is whitespace
  static bool isBlank(String? v) => isNull(v) || v!.trim().isEmpty;

  /// Returns `true` if [left] is equal to [right] irrespective of case
  ///
  /// `since 1.5.0`
  static bool equalsIgnoreCase(String? left, String? right) {
    return left?.toLowerCase() == right?.toLowerCase();
  }

  /// Returns `true` if [s] contains the [needle] irrespective of case
  ///
  /// `since 1.5.0`
  static bool containsIgnoreCase(String? s, String? needle) {
    if (isNull(s) && isNull(needle)) {
      return true;
    } else if (isNull(s) || isNull(needle)) {
      return false;
    } else {
      return s!.toLowerCase().contains(needle!.toLowerCase());
    }
  }

  /// Returns a new [String] from [s] which ends with the supplied [suffix].
  /// If [s] already ends with [suffix], [s] is returned unchanged.
  ///
  /// `since 1.5.0`
  static String ensureEndsWith(String s, String suffix) {
    return s.endsWith(suffix).isFalse ? '$s$suffix' : s;
  }
}
