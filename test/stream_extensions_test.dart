import 'package:pouch/pouch.dart' as pouch;
import 'package:pouch/pouch.dart';
import 'package:test/test.dart';

void main() {
  test('peek', () async {
    var coll = [1, 2, 3];
    var stream = Stream<int>.fromIterable(coll);
    var peeked = [];
    var actual = await stream.peek((e) => peeked.add(e)).toList();
    expect(peeked, equals(coll));
    expect(actual, equals(coll));
  });
}
