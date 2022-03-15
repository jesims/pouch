import 'package:file/file.dart';

import 'require.dart';

/// Utility for checking files
///
/// `since 0.7.0`
class RequireFile {
  RequireFile._();

  /// Throws an exception if the [file] does not exist (using [Require.require])
  ///
  /// `since 0.7.0`
  static Future<File> exists(File file) async {
    Require.require(
      await file.exists(),
      'File not found: ${file.path}',
    );
    return file;
  }
}
