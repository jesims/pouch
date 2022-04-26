import 'dart:async';

import 'future_extensions.dart';

/// Wait Helper Utilities
///
/// `since 0.4.0`
class Wait {
  Wait._();

  /// Waits for a supplied [taskName] to be complete by periodically checking
  /// (controlled by [checkInterval]) until [isDone] returns `true`.
  ///
  /// The task will be, at most, waited until [isDone] resolves `true` or
  /// until the until maximum specified [timeout] duration is reached.
  ///
  /// `since 0.4.0`
  static Future<void> until(
    String taskName,
    FutureOr<bool> Function() isDone, {
    Duration timeout = const Duration(seconds: 30),
    Duration checkInterval = const Duration(milliseconds: 100),
  }) async {
    var timeoutEpochMs =
        DateTime.now().millisecondsSinceEpoch + timeout.inMilliseconds;
    while (await isDone().isFalse) {
      if (timeoutEpochMs < DateTime.now().millisecondsSinceEpoch) {
        throw TimeoutException('timed out waiting for $taskName');
      }
      await Future<void>.delayed(checkInterval);
    }
  }
}
