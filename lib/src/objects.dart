import 'booleans.dart';

/// Returns its argument
///
/// `since 0.0.1`
T identity<T>(T x) => x;

/// True if the dynamic [value] is null
///
/// `since 0.0.1`
bool isNull(dynamic value) => value == null;

/// True if the dynamic [value] is not null
///
/// `since 0.0.1`
bool isNotNull(dynamic value) => isFalse(isNull(value));

/// Casts [x] to the specified type [T] if it is an instance of [T].
/// Null if [x] is not an instance of [T]
///
/// `since 0.0.1`
T? cast<T>(dynamic x) => x is T ? x : null;
