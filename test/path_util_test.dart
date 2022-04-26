import 'package:file/local.dart';
import 'package:pouch/pouch_io.dart';
import 'package:test/test.dart';

void main() {
  group('PathUtil', () {
    test('relativeToCurrent', () async {
      var fs = const LocalFileSystem();
      expect(
        PathUtil.relativeToCurrent('./lib/../lib/src'),
        endsWith('${fs.path.current}/lib/src'),
      );
    });
  });
}
