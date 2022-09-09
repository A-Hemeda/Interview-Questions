import '../models/zekr_model.dart';
import '../database/database_helper.dart';
import 'package:flutter/foundation.dart';

class AzkarProvider with ChangeNotifier {
  List<ZekrModel> _azkar = List<ZekrModel>();
  DatabaseHelper databaseHelper = new DatabaseHelper();

  String get table => 'azkar';

  int get length => _azkar.length;

  ZekrModel getZekr(int index) {
    return _azkar[index];
  }

  Future<bool> initialAllAzkar(String azkarIndex) async {
    try {
      _azkar.clear();
      List<Map<String, dynamic>> tempAzkar =
          await databaseHelper.getData(table, azkarIndex);
      print('tempAzkar.length : ${tempAzkar.length}');

      for (int i = 0; i < tempAzkar.length; i++)
        _azkar.add(ZekrModel.fromMap(tempAzkar[i]));

      print('_azkar.length : ${_azkar.length}');
      notifyListeners();
      return true;
    } catch (e) {
      print('Faild initialAllAzkar');
      print('e : $e');
      return false;
    }
  }
}
