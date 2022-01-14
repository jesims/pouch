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
