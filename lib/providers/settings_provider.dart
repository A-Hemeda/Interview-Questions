import '../models/settings_model.dart';
import '../database/database_helper.dart';
import 'package:flutter/foundation.dart';

class SettingsProvider with ChangeNotifier {
  SettingsModel _settings;
  DatabaseHelper databaseHelper = new DatabaseHelper();

  String get table => 'settings';

  dynamic getsettingField(String nameField) {
    switch (nameField) {
      case 'counter':
        return _settings.counter == 1 ? true : false;

      case 'diacritics':
        return _settings.diacritics == 1 ? true : false;

      case 'sanad':
        return _settings.sanad == 1 ? true : false;

      case 'font_family':
        return _settings.fontFamily;

      case 'font_size':
        return _settings.fontSize;
    }
    return _settings;
  }

  Future<bool> updateSettings(String nameField, dynamic value) async {
    print(' updateSettings $nameField');
    switch (nameField) {
      case 'counter':
        _settings.setCounter(value);
        break;

      case 'diacritics':
        _settings.setDiacritics(value);
        break;

      case 'sanad':
        _settings.setSanad(value);
        break;

      case 'font_family':
        _settings.setFontFamily(value);
        break;

      case 'font_size':
        _settings.setFontSize(value);
        break;
    }

    try {
      await databaseHelper.updateSettings(nameField, value);
      print('updateField : true');
      notifyListeners();
      return true;
    } catch (e) {
      print('updateField e : $e');
      return false;
    }
  }

  Future<bool> initialSettings() async {
    try {
      List<Map<String, dynamic>> tempSettings =
          await databaseHelper.getData(table, '-1');
      print('tempSettings.length : ${tempSettings.length}');

      _settings = SettingsModel.fromMap(tempSettings[0]);

      print('_settings.length : $_settings');
      notifyListeners();
      return true;
    } catch (e) {
      print('Faild initialSettings');
      print('e : $e');
      return false;
    }
  }
}
