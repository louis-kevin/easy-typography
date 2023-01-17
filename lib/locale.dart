abstract class TextLocale {
  String localize(String key);
}

class BaseTextLocale {
  static final BaseTextLocale _singleton = BaseTextLocale._internal();

  TextLocale? locale;

  factory BaseTextLocale() {
    return _singleton;
  }

  BaseTextLocale._internal();

  setLocale(TextLocale locale) {
    this.locale = locale;
  }

  localize(String key) {
    if(locale == null) return key;

    return locale!.localize(key);
  }
}