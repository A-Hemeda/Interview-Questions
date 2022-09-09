import '../database/database_helper.dart';
import '../models/sebha_model.dart';
import 'package:flutter/foundation.dart';

class SebhaProvider with ChangeNotifier {
  List<SebhaModel> _sebha = List<SebhaModel>();
  DatabaseHelper databaseHelper = new DatabaseHelper();

  String get table => 'tasbih';

  int get length => _sebha.length;

  int get newId => _sebha.isEmpty ? 0 : _sebha[length - 1].id + 1;

  SebhaModel getItemSebha(int index) {
    return _sebha[index];
  }

  SebhaModel getItemSebhaById(int id) {
    return _sebha.firstWhere((item) => id == item.id);
  }

  Future<bool> addItemToSebha(SebhaModel item) async {
    try {
      await databaseHelper.insert(table, item.toMap()); //addItemToSebha(item);
      _sebha.add(item);
      print('addItemToSebha');
      notifyListeners();
      return true;
    } catch (e) {
      print('Faild addItemToSebha');
      print('e : $e');
      return false;
    }
  }

  Future<bool> updateItemFromSebha(SebhaModel item) async {
    try {
      await databaseHelper.updateItemFromSebha(item);
      print('updateItemFromSebha');
      notifyListeners();
      return true;
    } catch (e) {
      print('Faild updateItemFromSebha');
      print('e : $e');
      return false;
    }
  }

  Future<bool> deleteItemFromSebha(int itemId) async {
    try {
      await databaseHelper.delete(
          table: table, id: itemId); //.deleteItemFromSebha(itemId);

      for (int i = 0; i < length; i++)
        if (_sebha[i].id == itemId) {
          _sebha.removeAt(i);
          break;
        }

      print('deleteItemFromSebha');
      notifyListeners();
      return true;
    } catch (e) {
      print('Faild deleteItemFromSebha');
      print('e : $e');
      return false;
    }
  }

  Future<bool> updateFavorite(int favorite, int id, int indexInList) async {
    try {
      await databaseHelper.updateFavoriteInTables(table, favorite, id);
      _sebha[indexInList].setFavorite(favorite);
      print('updateFavorite : true');
      return true;
    } catch (e) {
      print('updateFavorite e : $e');
      return false;
    }
  }

  Future<bool> initialAllItemsOfSebha() async {
    try {
      List<Map<String, dynamic>> tempSebha =
          await databaseHelper.getData(table, '-1');
      print('tempSebha.length : ${tempSebha.length}');

      for (int i = 0; i < tempSebha.length; i++)
        _sebha.add(SebhaModel.fromMap(tempSebha[i]));

      print('_sebha.length : ${_sebha.length}');
      notifyListeners();
      return true;
    } catch (e) {
      print('Faild initialAllItemsOfSebha');
      print('e : $e');
      return false;
    }
  }
}
