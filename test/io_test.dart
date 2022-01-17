import 'package:file/local.dart';
import 'package:file/memory.dart';
import 'package:path/path.dart' as p;
import 'package:pouch/pouch.dart';
import 'package:pouch/pouch_io.dart';
import 'package:test/test.dart';

void main() {
  test('lists globs', () async {
    //TODO use MemoryFileSystem
    var fs = LocalFileSystem();
    expect(
      await listFilesByGlob(['*.md'])
          //peek to make sure the FileSystemEntity is correct
          .peek(identity)
          .map((fse) => fse.path)
          .toSet(),
      {'README.md', 'CHANGELOG.md'}
          //TODO partial
          .map((s) => p.join(fs.currentDirectory.path, s))
          .toSet(),
    );
  });

  test('deletes recursively', () async {
    var fs = MemoryFileSystem();
    var dir = await fs.systemTempDirectory.createTemp('io-test-');
    var file = dir.childFile('file.txt');
    await file.create();
    expect(await file.exists(), true);
    await deleteFiles(Stream.value(dir));
    expect(await file.exists(), false);
    expect(await dir.exists(), false);
  });
}
