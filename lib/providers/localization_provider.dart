import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale _locale = const Locale('en', '');
  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'welcome': 'Welcome to MarketHub',
      'search_hint': 'Search for products...',
      'featured_deals': 'Featured Flash Deals',
      'categories': 'Shop by Categories',
      'add_to_cart': 'Add to Cart',
    },
    'es': {
      'welcome': 'Bienvenido a MarketHub',
      'search_hint': 'Buscar productos...',
      'featured_deals': 'Ofertas Flash Destacadas',
      'categories': 'Comprar por Categorías',
      'add_to_cart': 'Añadir al Carrito',
    },
    'hi': {
      'welcome': 'MarketHub में आपका स्वागत है',
      'search_hint': 'उत्पादों की खोज करें...',
      'featured_deals': 'विशेष फ्लैश सौदे',
      'categories': 'श्रेणियों के अनुसार खरीदारी करें',
      'add_to_cart': 'कार्ट में जोड़ें',
    },
  };

  String translate(String key) {
    return _localizedValues[_locale.languageCode]?[key] ?? key;
  }
}
