import 'dart:async';

// As it's required for FSE peek to operate correctly
// ignore: implementation_imports
import 'package:file/src/interface/file_system_entity.dart';
import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';
import 'package:path/path.dart' as p;

import 'strings.dart';

/// Lists all [FileSystemEntity]s matching the provided globs.
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
Future<Stream<FileSystemEntity>> listFilesByGlob(
  Iterable<String> globs, {
  String? workingDirectory,
}) async {
  var globContext = isNotBlank(workingDirectory)
      ? p.Context(current: workingDirectory)
      : p.context;
  return Glob("{${globs.join(',')}}", context: globContext)
      .list(root: globContext.current);
}

/// Recursively deletes all [FileSystemEntity]s in the provided [Stream]
///
/// `since 0.0.1`
Future<void> deleteFiles(Stream<FileSystemEntity> files) {
  return files.forEach((fse) async {
    await fse.delete(recursive: true);
  });
}
