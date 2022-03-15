// ignore: library_prefixes
import 'strings.dart' as StringUtils;

/// Extensions to [String]?
///
/// `since 0.7.0`
extension NullableStringExtensions on String? {
  /// Returns `true` if `this` is NOT blank. See [StringUtils.isBlank]
  ///
  /// `since 0.7.0`
  bool get isNotBlank {
    return StringUtils.isNotBlank(this);
  }

  /// Returns `true` if `this` is blank. See [StringUtils.isBlank]
  ///
  /// `since 0.7.0`
  bool get isBlank {
    return StringUtils.isBlank(this);
  }
}
