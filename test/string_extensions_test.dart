import 'package:faker/faker.dart';
import 'package:pouch/pouch.dart';
import 'package:test/test.dart';

void main() {
  group('NullableStringExtensions', () {
    group('isBlank', () {
      test('returns true if the string is blank', () {
        void expectTrue(String? s) {
          expect(s.isBlank, true);
        }

        expectTrue(null);
        expectTrue('');
        expectTrue(' ');
        expectTrue('\t');
      });
      test('returns false if the string is NOT blank', () {
        var s = Faker().lorem.sentence();
        expect(s.isBlank, false);
      });
    });
    group('isNotBlank', () {
      test('returns true if the string is NOT blank', () {
        var s = Faker().lorem.sentence();
        expect(s.isNotBlank, true);
      });
      test('returns false if the string is blank', () {
        void expectFalse(String? s) {
          expect(s.isNotBlank, false);
        }

        expectFalse(null);
        expectFalse('');
        expectFalse(' ');
        expectFalse('\t');
      });
    });
    group('isEmpty', () {
      test('returns true when string is null', () {
        String? s;
        expect(s, null);
        expect(s.isEmpty, true);
      });
      test('returns true when string is empty', () {
        expect(''.isEmpty, true);
      });
      test('returns false when string is not empty', () {
        expect(Faker().lorem.word().isEmpty, false);
      });
    });
    group('isNotEmpty', () {
      test('returns false when string is null', () {
        String? s;
        expect(s, null);
        expect(s.isNotEmpty, false);
      });
      test('returns false when string is empty', () {
        expect(''.isNotEmpty, false);
      });
      test('returns true when string is not empty', () {
        expect(Faker().lorem.word().isNotEmpty, true);
      });
    });
  });
}
