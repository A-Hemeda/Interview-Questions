import '../models/prayer_model.dart';
import '../database/database_helper.dart';
import 'package:flutter/foundation.dart';

class PrayerProvider with ChangeNotifier {
  List<PrayerModel> _prayer = List<PrayerModel>();
  Map<String, List<int>> _prayerGuide = Map<String, List<int>>();
  DatabaseHelper databaseHelper = new DatabaseHelper();

  String get table => 'prayer';

  int get length => _prayer.length;

  List<String> get allSurah => _prayerGuide.keys.toList();

  PrayerModel getPrayer(int index) {
    return _prayer[index];
  }

  List<int> getAyatSurah(String surah) {
    return _prayerGuide[surah];
  }

  int getAyaOfSurah(String surah, int index) {
    return _prayerGuide[surah][index];
  }

  Future<bool> updateFavorite(int favorite, int id) async {
    _prayer[id].setFavorite(favorite);
    try {
      await databaseHelper.updateFavoriteInTables('prayer', favorite, id);
      print('uptadeFavorite : true');
      return true;
    } catch (e) {
      print('uptadeFavorite e : $e');
      return false;
    }
  }

  Future<bool> initialAllPrayer() async {
    try {
      List<Map<String, dynamic>> tempPrayer =
          await databaseHelper.getData(table, '-1');
      print('tempPrayer.length : ${tempPrayer.length}');

      String nameSurah = tempPrayer[0]['surah'];
      _prayerGuide[nameSurah] = List<int>();
      for (int i = 0; i < tempPrayer.length; i++) {
        _prayer.add(PrayerModel.fromMap(tempPrayer[i]));

        String tempNameSurah = _prayer[i].surah;
        if (nameSurah != tempNameSurah) {
          _prayerGuide[tempNameSurah] = List<int>();
          nameSurah = tempNameSurah;
        }
        _prayerGuide[tempNameSurah].add(_prayer[i].id);
      }

      print('_prayer.length : ${_prayer.length}');
      notifyListeners();
      return true;
    } catch (e) {
      print('Faild initialAllPrayer');
      print('e : $e');
      return false;
    }
  }
}
