/// Extensions to [bool]
///
/// `since 0.7.0`
extension BoolExtensions on bool {
  /// Returns `true` when [this] is `false`
  ///
  /// `since 0.7.0`
  bool get isFalse => this == false;
}

/// Extensions to [bool]?
///
/// `since 1.0.0`
extension NullableBoolExtensions on bool? {
  /// Returns `true` when [this] is `true`
  ///
  /// `since 1.0.0`
  bool get isTrue => this == true;

  /// Returns `true` when [this] is `false`
  ///
  /// `since 1.0.0`
  bool get isFalse => this == false;
}
