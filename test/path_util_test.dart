import 'package:pouch/pouch_io.dart';
import 'package:test/test.dart';

void main() {
  group('PathUtil', () {
    test('relativeToCurrent', () async {
      expect(
        PathUtil.relativeToCurrent('./lib/../lib/src'),
        endsWith('pouch/lib/src'),
      );
    });
  });
}
