
enum LanguageEnum {
  vi, // Vietnamese
  en, // English
}

extension LanguageEnumExtension on LanguageEnum {
  String get local {
    switch (this) {
      case LanguageEnum.vi:
        return "vi";

      case LanguageEnum.en:
        return "en";
    }
  }

  String get localHeader {
    switch (this) {
      case LanguageEnum.vi:
        return "vi_VN";

      case LanguageEnum.en:
        return "en_US";
    }
  }

  String get langName {
    switch (this) {
      case LanguageEnum.vi:
        return "S.of(navigatorKey.currentContext!).vietnamese";

      case LanguageEnum.en:
        return "S.of(navigatorKey.currentContext!).english";
    }
  }
}
