import 'bool_extensions.dart';
import 'object_extensions.dart';
// ignore: library_prefixes
import 'strings.dart';

/// Extensions to [String]?
///
/// `since 0.7.0`
extension NullableStringExtensions on String? {
  /// Returns `true` if [this] is NOT blank. See [StringUtil.isBlank]
  ///
  /// `since 0.7.0`
  bool get isNotBlank {
    return StringUtil.isNotBlank(this);
  }

  /// Returns `true` if [this] is blank. See [StringUtil.isBlank]
  ///
  /// `since 0.7.0`
  bool get isBlank {
    return StringUtil.isBlank(this);
  }

  /// Returns `true` if [this] is `null` or empty
  ///
  /// `since 1.2.0`
  bool get isEmpty {
    return isNull || this!.isEmpty;
  }

  /// Returns `true` if [this] is NOT `null` and NOT empty
  ///
  /// `since 1.2.0`
  bool get isNotEmpty {
    return isEmpty.isFalse;
  }
}
