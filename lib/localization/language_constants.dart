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

const String LANGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String HINDI = 'hi';
const String SPANISH = 'es';

Future<Locale> setLocale(String languageCode) async {
  return Locale(languageCode, '');
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return const Locale(ENGLISH, '');
    case HINDI:
      return const Locale(HINDI, '');
    case SPANISH:
      return const Locale(SPANISH, '');
    default:
      return const Locale(ENGLISH, '');
  }
}
