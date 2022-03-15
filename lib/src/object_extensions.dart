/// Extensions to [Object]?
///
/// `since 0.7.0`
extension NullableObjectExtensions on Object? {
  /// Returns `true` if [this] is `null`
  ///
  /// `since 0.7.0`
  bool get isNull => this == null;

  /// Returns `true` if [this] is NOT `null`
  ///
  /// `since 0.7.0`
  bool get isNotNull => this != null;
}
