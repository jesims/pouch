// TODO move into a util class https://github.com/jesims/docs/blob/master/Coding-Conventions/Dart.md#utilities
import 'object_extensions.dart';

/// Returns its argument
///
/// `since 0.0.1`
T identity<T>(T x) => x;

/// Returns `true` if the [value] is `null`
///
/// `since 0.0.1`
bool isNull(Object? value) => value.isNull;

/// Returns `true` if the [value] is not `null`
///
/// `since 0.0.1`
bool isNotNull(Object? value) => value.isNotNull;

/// If [x] is an instance of [T], returns [x] cast to [T],
/// otherwise returns `null`.
///
/// `since 0.0.1`
T? cast<T>(Object? x) => x is T ? x : null;

/// Calls `toString` on [x]
///
/// `since 0.0.1`
String? toString(Object? x) {
  return x?.toString();
}
