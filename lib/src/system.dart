import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';

import 'collections.dart';

// ignore: public_member_api_docs
typedef PeekFunction = void Function<E>(E element);

/// Deletes all [FileSystemEntity]s matching the provided globs.
///
/// The globs will be combined to `Match one of several possibilities {...,...}`
///
/// See https://pub.dev/packages/glob for more information about globs
///
/// `since 0.0.1`
Future<void> deleteFilesMatchingGlobs(
  Iterable<String> globs, {
  PeekFunction? peek,
}) async {
  if (isEmpty(globs)) {
    return;
  }
  var searchPattern = "{${globs.join(',')}}";
  await Glob(searchPattern).list().forEach((fse) async {
    if (peek != null) {
      peek(fse);
    }
    await fse.delete(recursive: true);
  });
}
