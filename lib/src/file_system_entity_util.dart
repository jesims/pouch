import 'package:file/file.dart';

/// Utilities for [FileSystemEntity]
///
/// `since 1.3.0`
class FileSystemEntityUtil {
  FileSystemEntityUtil._();

  /// Deletes the [fileSystemEntity].
  ///
  /// Does not error if the [fileSystemEntity] does not exist.
  ///
  /// If the [FileSystemEntity] is a directory, and if [recursive] is `false`,
  /// the directory must be empty. Otherwise, if [recursive] is true, the
  /// directory and all sub-directories and files in the directories are
  /// deleted. Links are not followed when deleting recursively. Only the link
  /// is deleted, not its target.
  ///
  /// If [recursive] is true, the [FileSystemEntity] is deleted even if the type
  /// of the [FileSystemEntity] doesn't match the content of the file system.
  /// This behavior allows [delete] to be used to unconditionally delete any file
  /// system object.
  ///
  /// Returns a `Future<FileSystemEntity>` that completes with [this]
  /// [FileSystemEntity] when the deletion is done. If the [fileSystemEntity]
  /// cannot be deleted, the future completes with an exception.
  ///
  /// `since 1.3.0`
  static Future<void> delete(
    FileSystemEntity fileSystemEntity, {
    bool recursive = false,
  }) async {
    try {
      await fileSystemEntity.delete(recursive: recursive);
    } on FileSystemException {
      if (await fileSystemEntity.exists()) rethrow;
    }
  }
}
