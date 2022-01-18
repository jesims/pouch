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

  test('equalsIgnoreCase()', () {
    expect(strings.equalsIgnoreCase('', ''), isTrue);
    expect(strings.equalsIgnoreCase('Left ', 'left'), isFalse);
    expect(strings.equalsIgnoreCase('Left', 'LEFT'), isTrue);
    expect(strings.equalsIgnoreCase('Left', 'left'), isTrue);
    expect(strings.equalsIgnoreCase('Left', null), isFalse);
    expect(strings.equalsIgnoreCase('left', 'right'), isFalse);
    expect(strings.equalsIgnoreCase(null, 'right'), isFalse);
    expect(strings.equalsIgnoreCase(null, null), isTrue);
  });

  test('containsIgnoreCase()', () {
    expect(strings.containsIgnoreCase('', ''), isTrue);
    expect(strings.containsIgnoreCase('Left ', 'left'), isTrue);
    expect(strings.containsIgnoreCase('Left', 'LEFT'), isTrue);
    expect(strings.containsIgnoreCase('Left', null), isFalse);
    expect(strings.containsIgnoreCase('left', 'right'), isFalse);
    expect(
      strings.containsIgnoreCase('A longer sentence with Words', 'with words'),
      isTrue,
    );
    expect(strings.containsIgnoreCase(null, 'right'), isFalse);
    expect(strings.containsIgnoreCase(null, null), isTrue);
  });
}
