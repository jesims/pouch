/// An abstract representation of a Clock
///
/// `since 1.7.0`
abstract class Clock {
  /// Gets the current milliseconds that have elapsed since January 1, 1970
  /// (midnight UTC/GMT)
  ///
  /// `since 1.7.0`
  int millisecondsSinceEpoch();
}

/// An implementation of [Clock] that is backed by the native Dart [DateTime] utilities
///
/// `since 1.7.0`
class DartClock implements Clock {
  static DateTime _defaultTime() => DateTime.now();

  final DateTime Function() _now;

  /// Constructs an instance of [DartClock].
  ///
  /// An optional implementation of [_now] can be provided to override implementation
  ///
  /// `since 1.7.0`
  DartClock([this._now = _defaultTime]);

  @override
  int millisecondsSinceEpoch() => _now().millisecondsSinceEpoch;
}
