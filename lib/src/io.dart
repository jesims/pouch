import 'dart:async';

import 'package:file/file.dart';
import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';
import 'package:path/path.dart' as p;

// TODO move into a util class https://github.com/jesims/docs/blob/master/Coding-Conventions/Dart.md#utilities
import 'strings.dart';

/// Lists all [File](https://pub.dev/packages/file) [FileSystemEntity]s matching the provided globs.
///
/// The globs will be combined to `Match one of several possibilities {...,...}`
///
/// See https://pub.dev/packages/glob for more information about globs
///
/// [workingDirectory] will be the root path for the glob pattern to be
/// evaluated in. Defaults to the current working directory provided by
/// [p.context]
///
/// `since 0.0.1`
//TODO add ability to specify FileSystem
Stream<FileSystemEntity> listFilesByGlob(
  Iterable<String> globs, {
  String? workingDirectory,
}) {
  var context = isNotBlank(workingDirectory)
      ? p.Context(current: workingDirectory)
      : p.context;
  return Glob(
    globs.length == 1 ? globs.first : "{${globs.join(',')}}",
    context: context,
  ).list(root: context.current);
}

/// Recursively deletes all [File](https://pub.dev/packages/file) [FileSystemEntity]s in the provided [Stream]
///
/// `since 0.0.1`
Future<void> deleteFiles(Stream<FileSystemEntity> files) async {
  return files.forEach((fse) async {
    await fse.delete(recursive: true);
  });
}
