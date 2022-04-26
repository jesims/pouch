import 'package:equatable/equatable.dart';

/// A Basic representation of Time in 24 hour format
/// `since 1.4.0`
class Time extends Equatable {
  /// The total number of hours into the day (0-23).
  /// `since 1.4.0`
  final int hour;

  /// The total number of minutes past the [hour] (0-59).
  /// `since 1.4.0`
  final int minute;

  /// The total number of seconds past the [minute] (0-59).
  /// `since 1.4.0`
  final int second;

  /// Create a [Time] from the provided values.
  /// `since 1.4.0`
  const Time({
    this.hour = 0,
    this.minute = 0,
    this.second = 0,
  })  : assert(0 <= hour),
        assert(hour <= 23),
        assert(0 <= minute),
        assert(minute <= 59),
        assert(0 <= second),
        assert(second <= 59);

  @override
  List<Object> get props => [hour, minute, second];
}
