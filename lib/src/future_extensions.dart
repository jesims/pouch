import 'dart:async';

import 'bool_extensions.dart';

/// Extensions to [Future]<bool>
///
/// `since 0.7.0`
extension FutureBoolExtensions on Future<bool> {
  /// Returns `true` when [this] value is `false`
  ///
  /// `since 0.7.0`
  Future<bool> get isFalse async {
    var result = await this;
    return result == false;
  }
}

/// Extensions to [FutureOr]<bool>
///
/// `since 1.0.0`
extension FutureOrBoolExtensions on FutureOr<bool> {
  /// Returns `true` when [this] value is `false`
  ///
  /// `since 1.0.0`
  Future<bool> get isFalse async {
    var result = await this;
    return result.isFalse;
  }
}
