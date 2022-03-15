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
  });
}
