import 'package:pouch/src/map_util.dart';
import 'package:test/test.dart';

void main() {
  group('MapUtil', () {
    test('removeNullValues', () {
      expect(
        MapUtil.removeNullValues({
          'a': 1,
          'b': null,
          'c': 4,
        }),
        equals({
          'a': 1,
          'c': 4,
        }),
      );
    });
  });
}
