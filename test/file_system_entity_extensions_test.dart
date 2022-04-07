import 'dart:io' as io;

import 'package:file/memory.dart';
import 'package:path/path.dart' as path;
import 'package:pouch/pouch.dart';
import 'package:pouch/pouch_io.dart';
import 'package:test/test.dart';

void main() {
  var fs = MemoryFileSystem();
  group('FileSystemEntityExtensions', () {
    group('deleteExisting', () {
      var file = fs.file('test.txt');
      var dir = fs.directory('dir');
      var fileInDir = fs.file(path.join(dir.path, file.basename));
      test('deletes the file', () async {
        if (await file.exists().isFalse) {
          await file.create();
        }
        expect(await file.exists(), true);
        await file.deleteExisting();
        expect(await file.exists(), false);
      });
      test('deletes the directory', () async {
        if (await dir.exists().isFalse) {
          await dir.create();
        }
        await dir.create();
        expect(await dir.exists(), true);
        if (await fileInDir.exists().isFalse) {
          await fileInDir.create();
        }
        expect(await fileInDir.exists(), true);
        await dir.deleteExisting(recursive: true);
        expect(await dir.exists(), false);
        expect(await fileInDir.exists(), false);
      });
      test('does not error if the file does not exist', () async {
        if (await file.exists()) {
          await file.delete();
        }
        expect(await file.exists(), false);
        await file.deleteExisting();
        expect(
          () async => await file.delete(),
          throwsA(TypeMatcher<io.FileSystemException>()),
        );
      });
      test('does not error if the dir does not exist', () async {
        if (await dir.exists()) {
          await dir.delete();
        }
        expect(await dir.exists(), false);
        await dir.deleteExisting();
        expect(
          () async => await dir.delete(),
          throwsA(TypeMatcher<io.FileSystemException>()),
        );
      });
    });
  });
}
