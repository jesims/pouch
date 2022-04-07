import 'package:file/local.dart';
import 'package:path/path.dart' as path;

/// Path Helper Utilities
class PathUtil {
  PathUtil._();

  /// Returns a normalized, absolute path to the specified folder name from the
  /// current working directory. Supporting `../` and `./` traversal
  ///
  /// `since 0.4.0`
  static String relativeToCurrent(String folder) {
    return path.normalize(
      LocalFileSystem().currentDirectory.childDirectory(folder).absolute.path,
    );
  }
}
