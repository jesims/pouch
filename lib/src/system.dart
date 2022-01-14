import 'dart:io';

import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';
import 'package:path/path.dart' as p;

import 'collections.dart';
import 'objects.dart';
import 'strings.dart';

// ignore: public_member_api_docs
typedef FileSystemEntityPeekFunction = void Function(FileSystemEntity element);

/// Deletes all [FileSystemEntity]s matching the provided globs.
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
Future<void> deleteFilesMatchingGlobs(
  Iterable<String> globs, {
  FileSystemEntityPeekFunction? peek,
  String? workingDirectory,
}) async {
  if (isEmpty(globs)) {
    return;
  }
  p.Context? globContext;
  if (isNotBlank(workingDirectory)) {
    globContext = p.Context(current: workingDirectory);
  }
  await Glob(
    "{${globs.join(',')}}",
    context: globContext,
  ).list(root: globContext?.current).forEach((fse) async {
    if (isNotNull(peek)) {
      peek!(fse);
    }
    await fse.delete(recursive: true);
  });
}
