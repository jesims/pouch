/// Functional Predicate (boolean-valued function) Helpers and Utilities
class Predicates {
  Predicates._();

  /// Returns a predicate that will return `true` when the given variable is
  /// equal to the pre-defined value [r].
  ///
  /// `since 0.3.0`
  static bool Function(R) eq<R>(R r) {
    return (v) => v == r;
  }

  /// Returns a predicate that will return `true` when the given variable is NOT
  /// equal to the pre-defined value [r].
  ///
  /// `since 0.3.0`
  static bool Function(R) ne<R>(R r) {
    return (v) => !Predicates.eq(r)(v);
  }
}
