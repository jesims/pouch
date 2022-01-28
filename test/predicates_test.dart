import 'package:pouch/pouch.dart' as pouch;
import 'package:test/test.dart';

void main() {
  group('Predicates', () {
    group('eq', () {
      test('numbers', () {
        var actual = pouch.Predicates.eq(1);

        expect(actual(2), isFalse);
        expect(actual(1), isTrue);
      });

      test('strings', () {
        var actual = pouch.Predicates.eq('hello');

        expect(actual('hello'), isTrue);
        expect(actual('world'), isFalse);
      });
    });

    group('ne', () {
      test('numbers', () {
        var actual = pouch.Predicates.ne(1);

        expect(actual(2), isTrue);
        expect(actual(1), isFalse);
      });

      test('strings', () {
        var actual = pouch.Predicates.ne('hello');

        expect(actual('hello'), isFalse);
        expect(actual('world'), isTrue);
      });
    });
  });
}
