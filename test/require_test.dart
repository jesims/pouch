import 'package:faker/faker.dart';
import 'package:pouch/pouch.dart';
import 'package:test/test.dart';

void main() {
  group('Require', () {
    group('require', () {
      test('throws an exception if check is false', () {
        expect(
          () => Require.require(false, Faker().lorem.sentence()),
          throwsException,
        );
      });
      test('returns check', () {
        expect(Require.require(true, Faker().lorem.sentence()), true);
      });
    });
  });
}
