import 'package:pouch/pouch.dart' as strings;
import 'package:test/test.dart';

void main() {
  test('isNotBlank() is true if the value is not blank', () {
    expect(strings.isNotBlank(null), isFalse);
    expect(strings.isNotBlank(''), isFalse);
    expect(strings.isNotBlank('    '), isFalse);
    expect(strings.isNotBlank('\t   \t'), isFalse);
    expect(strings.isNotBlank('value'), isTrue);
    expect(strings.isNotBlank('\t   \t hiya \t'), isTrue);
  });

  test('isBlank() is true if the value is blank', () {
    expect(strings.isBlank(null), isTrue);
    expect(strings.isBlank(''), isTrue);
    expect(strings.isBlank('    '), isTrue);
    expect(strings.isBlank('\t   \t'), isTrue);
    expect(strings.isBlank('value'), isFalse);
    expect(strings.isBlank('\t   \t hiya \t'), isFalse);
  });
}
