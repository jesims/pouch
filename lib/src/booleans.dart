// TODO move into a util class https://github.com/jesims/docs/blob/master/Coding-Conventions/Dart.md#utilities
import 'bool_extensions.dart';

/// Returns `true` if the boolean [value] is `false`.
/// Use [BoolExtensions] instead
///
/// `since 0.0.1`
bool isFalse(bool? value) => value.isFalse;

/// Returns `true` if the boolean [value] is `true`
///
/// `since 0.0.1`
bool isTrue(bool? value) => value.isTrue;
