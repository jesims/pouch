import 'package:faker/faker.dart';
import 'package:file/memory.dart';
import 'package:pouch/pouch.dart' as path;
import 'package:pouch/pouch_io.dart';
import 'package:test/test.dart';

void main() {
  group('RequireFile', () {
    group('exists', () {
      test('throws an exception if file does not exist', () async {
        var file = MemoryFileSystem().file('test.file');
        expect(await file.exists(), false);
        expect(
          () => RequireFile.exists(file),
          throwsA(const TypeMatcher<path.RequireException>()),
        );
      });
      test('returns the file if it does exist', () async {
        var file = MemoryFileSystem().file('test.file');
        await file.writeAsString(Faker().lorem.sentence());
        expect(await file.exists(), true);
        expect(await RequireFile.exists(file), file);
      });
    });
  });
}
