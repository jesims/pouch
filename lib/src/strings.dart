import 'objects.dart';

/// True if the provided [String] value [v] is not null and is not blank
/// (whitespaces)
///
/// `since 0.0.1`
bool isNotBlank(String? v) => isNotNull(v) && v!.trim().isNotEmpty;

/// True if the provided [String] value [v] is null or blank (whitespace only)
///
/// `since 0.0.1`
bool isBlank(String? v) => isNull(v) || v!.trim().isEmpty;
