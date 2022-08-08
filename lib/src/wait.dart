import 'dart:async';

import '../pouch.dart';
import 'package:meta/meta.dart';

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

/// Utility class that aids in waiting for a predicate to be met.
///
/// `since 1.7.0`
abstract class Waiter {
  /// Waits for [isFinished] to resolve `true` for the identified [task].
  ///
  /// `since 1.7.0`
  Future<void> until(
    String task,
    FutureOr<bool> Function() isFinished,
  );
}

/// A polling implementation of [Waiter]
///
/// `since 1.7.0`
class PollingWaiter implements Waiter {
  /// The Duration to wait before any predicate to become true
  ///
  /// `since 1.7.0`
  final Duration timeout;

  /// The duration to wait between predicate checks
  ///
  /// `since 1.7.0`
  final Duration interval;

  /// Implementation of [Clock] for time keeping
  ///
  /// `since 1.7.0`
  @visibleForTesting
  final Clock clock;

  /// Implementation of performing a wait for a specified [duration]
  ///
  /// `since 1.7.0`
  @visibleForTesting
  Future<void> Function(Duration duration) delay = Future<void>.delayed;

  /// Constructs a new instance of [PollingWaiter]
  ///
  /// `since 1.7.0`
  PollingWaiter({
    this.timeout = const Duration(seconds: 30),
    this.interval = const Duration(milliseconds: 100),
    this.clock = const DartClock(),
  });

  @override
  Future<void> until(String task, FutureOr<bool> Function() isFinished) async {
    var timeoutEpochMs =
        clock.millisecondsSinceEpoch() + timeout.inMilliseconds;
    while (await isFinished().isFalse) {
      if (timeoutEpochMs < clock.millisecondsSinceEpoch()) {
        throw TimeoutException('Waiting for $task');
      }
      await delay(interval);
    }
  }
}
