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

  group('isEmpty', () {
    test('returns true when map is null', () {
      Map<int, int>? genericMap;
      expect(genericMap.isEmpty, true);
      Map<int, int>? rawMap;
      expect(rawMap.isEmpty, true);
    });
    test('returns true when map is empty', () {
      expect(<int, int>{}.isEmpty, true);
    });
    test('returns false when map is not empty', () {
      expect({1: 1}.isEmpty, false);
    });
  });

  group('isNotEmpty', () {
    test('returns false when map is null', () {
      Map<int, int>? genericMap;
      expect(genericMap.isNotEmpty, false);
      Map<int, int>? rawMap;
      expect(rawMap.isNotEmpty, false);
    });
    test('returns false when map is empty', () {
      expect(<int, int>{}.isNotEmpty, false);
    });
    test('returns false when map is not empty', () {
      expect({1: 1}.isNotEmpty, true);
    });
  });
}
