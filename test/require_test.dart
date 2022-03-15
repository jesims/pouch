import 'package:faker/faker.dart';
import 'package:pouch/pouch.dart';
import 'package:test/test.dart';

void main() {
  group('Require', () {
    group('require', () {
      test('throws an exception if check is false', () {
        expect(
          () => Require.require(false, Faker().lorem.sentence()),
          throwsA(TypeMatcher<RequireException>()),
        );
      });
    });
    group('notBlank', () {
      test('throws an exception if string is blank', () {
        void expectThrown(String? s) {
          expect(
            () => Require.notBlank(s),
            throwsA(TypeMatcher<RequireException>()),
          );
        }

        expectThrown(null);
        expectThrown('');
        expectThrown(' ');
      });
      test('returns string', () {
        var s = Faker().lorem.sentence();
        expect(Require.notBlank(s), s);
      });
    });
  });
}
