import 'package:flutter/material.dart';
import 'app_localizations.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appLocal = new AppLocalizations(locale);
    await appLocal.loadFileKeys();

    print("Load ${locale.languageCode}");

    return appLocal;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;

  static Locale resolution(
      Locale currentLocale, Iterable<Locale> supportedLocales) {
    if (currentLocale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == currentLocale.languageCode)
          return supportedLocale;
      }
    }
    return supportedLocales.first;
  }

  static List<Locale> supportedLocales() {
    return [const Locale('ar', '')];
  }
}
