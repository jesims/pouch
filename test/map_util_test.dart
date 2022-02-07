import 'package:pouch/src/map_util.dart';
import 'package:test/test.dart';

void main() {
  group('MapExtensions', () {
    test('removeNullValues', () {
      var map = {
        'a': 1,
        'b': null,
        'c': 4,
      };

      expect(
        map.removeNullValues(),
        equals({
          'a': 1,
          'c': 4,
        }),
      );
    });
  });
}
