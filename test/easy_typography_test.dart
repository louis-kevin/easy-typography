import 'package:flutter_test/flutter_test.dart';

import 'package:easy_typography/easy_typography.dart';

const testText = 'my body large text';

class Locale extends TextLocale {
  @override
  String localize(String key) {
    return testText;
  }
}

void main() {
  test('same text using text param', () {
    var text = const BodyLargeText(testText);
    expect(text.buildText(), testText);
  });

  test('same text using text key', () {
    var text = const BodyLargeText.key(testText);
    expect(text.buildText(), testText);
  });

  test('text from locale using text key', () {
    BaseTextLocale().setLocale(Locale());
    var text = const BodyLargeText.key('my_key');
    expect(text.buildText(), testText);
  });
}
