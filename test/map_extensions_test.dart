import 'package:pouch/src/map_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('MapExtensions', () {
    test('removeNullValues', () {
      expect(
        {
          'a': 1,
          'b': null,
          'c': 4,
        }.removeNullValues(),
        equals({
          'a': 1,
          'c': 4,
        }),
      );
    });
  });
}
