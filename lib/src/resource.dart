/// [Resource] and [ResourceSync] utils
///
/// `since 0.8.0`
//TODO remove once https://github.com/dart-lang/language/issues/2051 is done
class ResourceUtils {
  /// Finally [Resource.dispose]s a [resource] after passing it to [fn].
  /// Returns the result of [fn].
  /// See also [Resource.using]
  ///
  /// `since 0.8.0`
  static Future<R> using<R, T extends Resource>(
    T resource,
    Future<R> Function(T) fn,
  ) async {
    try {
      return await fn(resource);
    } finally {
      await resource.dispose();
    }
  }

  /// Synchronous version of [ResourceUtils.using]
  ///
  /// `since 0.8.0`
  static R usingSync<R, T extends Resource>(
    T resource,
    R Function(T) fn,
  ) {
    try {
      return fn(resource);
    } finally {
      resource.dispose();
    }
  }
}

/// Synchronous version of [Resource]
///
/// `since 0.8.0`
//TODO remove once https://github.com/dart-lang/sdk/issues/43490 is done
mixin ResourceSync {
  /// Synchronous version of [Resource.dispose].
  ///
  /// `since 0.8.0`
  void disposeSync();

  /// Calls [ResourceUtils.usingSync] on `this`.
  ///
  /// `since 0.8.0`
  R using<R, S extends Resource>(R Function(S) fn) {
    return ResourceUtils.usingSync(this as S, fn);
  }
}

/// A resource that needs to be [dispose]d (cleaned up)
///
/// `since 0.8.0`
//TODO remove once https://github.com/dart-lang/sdk/issues/43490 is done
mixin Resource {
  /// Stops, cancels, and cleans up the resource.
  /// Should be called in a `finally` block.
  ///
  /// `since 0.8.0`
  Future<void> dispose();

  /// Calls [ResourceUtils.using] on `this`.
  ///
  /// `since 0.8.0`
  Future<R> using<R, S extends Resource>(Future<R> Function(S) fn) async {
    return await ResourceUtils.using(this as S, fn);
  }
}
