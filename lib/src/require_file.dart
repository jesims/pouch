import 'package:file/file.dart';

import 'require.dart';

/// Utility for checking files
///
/// `since 0.7.0`
class RequireFile {
  RequireFile._();

  /// Throws an exception if the [fse] does not exist (using [Require.require])
  ///
  /// `since 0.7.0`
  static Future<T> exists<T extends FileSystemEntity>(T fse) async {
    Require.require(
      await fse.exists(),
      'File not found: ${fse.path}',
    );
    return fse;
  }
}
