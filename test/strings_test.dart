import 'package:pouch/pouch.dart' show StringUtil;
import 'package:test/test.dart';

void main() {
  test('isNotBlank() is true if the value is not blank', () {
    expect(StringUtil.isNotBlank(null), isFalse);
    expect(StringUtil.isNotBlank(''), isFalse);
    expect(StringUtil.isNotBlank('    '), isFalse);
    expect(StringUtil.isNotBlank('\t   \t'), isFalse);
    expect(StringUtil.isNotBlank('value'), isTrue);
    expect(StringUtil.isNotBlank('\t   \t hiya \t'), isTrue);
  });

  test('isBlank() is true if the value is blank', () {
    expect(StringUtil.isBlank(null), isTrue);
    expect(StringUtil.isBlank(''), isTrue);
    expect(StringUtil.isBlank('    '), isTrue);
    expect(StringUtil.isBlank('\t   \t'), isTrue);
    expect(StringUtil.isBlank('value'), isFalse);
    expect(StringUtil.isBlank('\t   \t hiya \t'), isFalse);
  });

  test('equalsIgnoreCase()', () {
    expect(StringUtil.equalsIgnoreCase('', ''), isTrue);
    expect(StringUtil.equalsIgnoreCase('Left ', 'left'), isFalse);
    expect(StringUtil.equalsIgnoreCase('Left', 'LEFT'), isTrue);
    expect(StringUtil.equalsIgnoreCase('Left', 'left'), isTrue);
    expect(StringUtil.equalsIgnoreCase('Left', null), isFalse);
    expect(StringUtil.equalsIgnoreCase('left', 'right'), isFalse);
    expect(StringUtil.equalsIgnoreCase(null, 'right'), isFalse);
    expect(StringUtil.equalsIgnoreCase(null, null), isTrue);
  });

  test('containsIgnoreCase()', () {
    expect(StringUtil.containsIgnoreCase('', ''), isTrue);
    expect(StringUtil.containsIgnoreCase('Left ', 'left'), isTrue);
    expect(StringUtil.containsIgnoreCase('Left', 'LEFT'), isTrue);
    expect(StringUtil.containsIgnoreCase('Left', null), isFalse);
    expect(StringUtil.containsIgnoreCase('left', 'right'), isFalse);
    expect(
      StringUtil.containsIgnoreCase(
        'A longer sentence with Words',
        'with words',
      ),
      isTrue,
    );
    expect(StringUtil.containsIgnoreCase(null, 'right'), isFalse);
    expect(StringUtil.containsIgnoreCase(null, null), isTrue);
  });
}
