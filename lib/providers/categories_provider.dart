import '../database/database_helper.dart';
import '../models/category_model.dart';
import 'package:flutter/foundation.dart';

class CategoriesProvider with ChangeNotifier {
  List<CategoryModel> _categories = List<CategoryModel>();
  DatabaseHelper databaseHelper = new DatabaseHelper();

  String get table => 'categories';

  int get length => _categories.length;

  CategoryModel getCategory(int index) {
    return _categories[index];
  }

  List<String> get allCategoriesName {
    List<String> tempList = List<String>();
    for (int i = 0; i < length; i++)
      tempList.add(_categories[i].nameWithoutDiacritics);
    return tempList;
  }

  Future<bool> updateFavorite(int favorite, int id) async {
    _categories[id].setFavorite(favorite);
    try {
      await databaseHelper.updateFavoriteInTables('categories', favorite, id);
      print('uptadeFavorite : true');
      notifyListeners();
      return true;
    } catch (e) {
      print('uptadeFavorite e : $e');
      return false;
    }
  }

  Future<bool> initialAllCategories() async {
    try {
      List<Map<String, dynamic>> tempCategories =
          await databaseHelper.getData(table, '-1');
      print('tempCategories.length : ${tempCategories.length}');

      for (int i = 0; i < tempCategories.length; i++)
        _categories.add(CategoryModel.fromMap(tempCategories[i]));

      print('_categories.length : ${_categories.length}');
      notifyListeners();
      return true;
    } catch (e) {
      print('Faild initialAllCategories');
      print('e : $e');
      return false;
    }
  }
}
