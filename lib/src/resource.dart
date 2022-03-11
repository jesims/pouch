///
///
/// `since 0.8.0`
//TODO remove once https://github.com/dart-lang/language/issues/2051 is done
class ResourceUtils {
  ///
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

  ///
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

///
///
/// `since 0.8.0`
//TODO remove once https://github.com/dart-lang/sdk/issues/43490 is done
mixin ResourceSync {
  void disposeSync();

  ///
  ///
  /// `since 0.8.0`

  R using<R, S extends Resource>(R Function(S) fn) {
    return ResourceUtils.usingSync(this as S, fn);
  }
}

///
///
/// `since 0.8.0`
//TODO remove once https://github.com/dart-lang/sdk/issues/43490 is done
mixin Resource {
  ///
  ///
  /// `since 0.8.0`
  Future<void> dispose();

  ///
  ///
  /// `since 0.8.0`
  Future<R> using<R, S extends Resource>(Future<R> Function(S) fn) async {
    return await ResourceUtils.using(this as S, fn);
  }
}
