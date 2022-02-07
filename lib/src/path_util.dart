import 'package:file/local.dart';
import 'package:path/path.dart' as p;

/// Path Helper Utilities
class PathUtil {
  PathUtil._();

  /// Returns a normalized, absolute path to the specified folder name from the
  /// current working directory. Supporting `../` and `./` traversal
  static String relativeToCurrent(String folder) {
    return p.normalize(
      LocalFileSystem().currentDirectory.childDirectory(folder).absolute.path,
    );
  }
}
