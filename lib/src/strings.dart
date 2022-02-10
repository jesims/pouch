// TODO move into a util class https://github.com/jesims/docs/blob/master/Coding-Conventions/Dart.md#utilities
import 'booleans.dart';
import 'objects.dart';

/// Returns `true` if the provided [String] value [v] is not `null` and is not
/// blank (whitespaces)
///
/// `since 0.0.1`
bool isNotBlank(String? v) => isFalse(isBlank(v));

/// Returns `true` if the provided [String] value [v] is `null` or blank
/// (whitespace only)
///
/// `since 0.0.1`
// TODO improver performance by checking if every character is whitespace
bool isBlank(String? v) => isNull(v) || v!.trim().isEmpty;

/// Returns `true` if [left] is equal to [right] irrespective of case
///
/// `since 0.1.0`
bool equalsIgnoreCase(String? left, String? right) {
  return left?.toLowerCase() == right?.toLowerCase();
}

/// Returns `true` if [s] contains the [needle] irrespective of case
///
/// `since 0.1.0`
bool containsIgnoreCase(String? s, String? needle) {
  if (isNull(s) && isNull(needle)) {
    return true;
  } else if (isNull(s) || isNull(needle)) {
    return false;
  } else {
    return s!.toLowerCase().contains(needle!.toLowerCase());
  }
}
