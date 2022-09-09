import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Map<String, String> _localizedValues;

  Future loadFileKeys() async {
    String langFile = await rootBundle
        .loadString('assets/lang/${this.locale.languageCode}.json');
    Map<String, dynamic> loadedValues = jsonDecode(langFile);

    this._localizedValues =
        loadedValues.map((key, value) => MapEntry(key, value.toString()));
  }

  String translate(String key) {
    return _localizedValues[key];
  }
}
