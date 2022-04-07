import 'package:file/file.dart';

import 'file_system_entity_util.dart';

///
///
/// `since 1.3.0`
extension FileSystemEntityExtensions on FileSystemEntity {
  /// Deletes [this] [FileSystemEntity].
  ///
  /// Does nothing if [this] [FileSystemEntity] does not exist.
  ///
  /// If the [FileSystemEntity] is a directory, and if [recursive] is `false`,
  /// the directory must be empty. Otherwise, if [recursive] is true, the
  /// directory and all sub-directories and files in the directories are
  /// deleted. Links are not followed when deleting recursively. Only the link
  /// is deleted, not its target.
  ///
  /// If [recursive] is true, the [FileSystemEntity] is deleted even if the type
  /// of the [FileSystemEntity] doesn't match the content of the file system.
  /// This behavior allows [deleteExisting] to be used to unconditionally delete any file
  /// system object.
  ///
  /// Returns a `Future<FileSystemEntity>` that completes with [this]
  /// [FileSystemEntity] when the deletion is done. If the [FileSystemEntity]
  /// cannot be deleted, the future completes with an exception.
  ///
  /// `since 1.3.0`
  //FIXME is this the best name?
  Future<void> deleteExisting({
    bool recursive = false,
  }) async {
    return FileSystemEntityUtil.delete(this, recursive: recursive);
  }
}
