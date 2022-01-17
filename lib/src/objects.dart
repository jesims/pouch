import 'booleans.dart';

/// Returns its argument
///
/// `since 0.0.1`
T identity<T>(T x) => x;

/// Returns `true` if the dynamic [value] is `null`
///
/// `since 0.0.1`
bool isNull(dynamic value) => value == null;

/// Returns `true` if the dynamic [value] is not `null`
///
/// `since 0.0.1`
bool isNotNull(dynamic value) => isFalse(isNull(value));

/// If [x] is an instance of [T], returns [x] cast to [T],
/// otherwise returns `null`.
///
/// `since 0.0.1`
T? cast<T>(dynamic x) => x is T ? x : null;

/// Calls `toString` on [x]
///
/// `since 0.0.1`
String? toString(dynamic x) {
  return x?.toString();
}
