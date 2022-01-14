import 'dart:io';

import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';
import 'package:path/path.dart' as p;
import 'package:pouch/pouch.dart';

import 'collections.dart';

// ignore: public_member_api_docs
typedef FileSystemEntityPeekFunction = void Function(FileSystemEntity element);

/// Deletes all [FileSystemEntity]s matching the provided globs.
///
/// The globs will be combined to `Match one of several possibilities {...,...}`
///
/// See https://pub.dev/packages/glob for more information about globs
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
  p.Context? ctx;
  if (isNotBlank(workingDirectory)) {
    ctx = p.Context(current: workingDirectory);
  }
  await Glob(
    "{${globs.join(',')}}",
    context: ctx,
  ).list().forEach((fse) async {
    if (peek != null) {
      peek(fse);
    }
    await fse.delete(recursive: true);
  });
}
