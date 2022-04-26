import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

/// A Basic representation of a Date
/// `since 1.4.0`
class Date extends Equatable {
  /// The calendar year
  /// `since 1.4.0`
  final int year;

  /// The month of the [year], 1-indexed.
  /// `since 1.4.0`
  final int month;

  /// The day of the [month], 1-indexed.
  /// `since 1.4.0`
  final int day;

  /// Returns `true` if the provided [year], [month], and [day] values can be
  /// parsed into a valid [Date] object.
  /// `since 1.4.0`
  static bool isValidDate(int year, int month, int day) {
    try {
      var yearStr = year.toString().padLeft(4, '0');
      var monthStr = month.toString().padLeft(2, '0');
      var dayStr = day.toString().padLeft(2, '0');
      var parsed = DateFormat('yyyy-MM-dd').parse('$yearStr-$monthStr-$dayStr');
      return parsed.year == year && parsed.month == month && parsed.day == day;
    } catch (_) {
      return false;
    }
  }

  /// Create a [Date] from the provided values.
  /// `since 1.4.0`
  Date({
    required this.year,
    this.month = 1,
    this.day = 1,
  }) : assert(isValidDate(year, month, day));

  @override
  List<Object> get props => [year, month, day];
}
