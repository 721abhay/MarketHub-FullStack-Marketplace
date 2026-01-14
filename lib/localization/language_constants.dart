import 'package:flutter/material.dart';

class Language {
  final int id;
  final String name;
  final String flag;
  final String languageCode;

  Language(this.id, this.name, this.flag, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, 'English', '🇺🇸', 'en'),
      Language(2, 'Hindi', '🇮🇳', 'hi'),
      Language(3, 'Spanish', '🇪🇸', 'es'),
    ];
  }
}

const String languageCodeConstant = 'languageCode';

//languages code
const String english = 'en';
const String hindi = 'hi';
const String spanish = 'es';

Future<Locale> setLocale(String languageCode) async {
  return Locale(languageCode, '');
}

Locale getLocale(String languageCode) {
  switch (languageCode) {
    case english:
      return const Locale(english, '');
    case hindi:
      return const Locale(hindi, '');
    case spanish:
      return const Locale(spanish, '');
    default:
      return const Locale(english, '');
  }
}
