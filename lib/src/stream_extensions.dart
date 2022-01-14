import 'dart:async';

/// Extends [Stream]s with some common helper properties and functions
///
/// `since 0.0.1`
extension StreamExtensions<E> on Stream<E> {
  /// Returns an [Stream] consisting of the elements of this [Stream],
  /// additionally performing the provided action on each element as elements
  /// are consumed from the resulting [Stream]
  ///
  /// `since 0.0.1`
  Stream<E> peek(void Function(E element) fn) {
    var transformer = StreamTransformer<E, E>.fromHandlers(
      handleData: (data, sink) {
        fn(data);
        return sink.add(data);
      },
    );
    return transform(transformer);
  }
}
