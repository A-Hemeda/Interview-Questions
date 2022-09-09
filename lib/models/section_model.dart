import 'dart:convert';

class SectionModel {
  int _id;
  String _name;
  List<int> _categoriesIndex;

  SectionModel(
    this._id,
    this._name,
    this._categoriesIndex,
  );

  SectionModel.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _name = map['name'];
    _categoriesIndex = List.from(jsonDecode(map['categories_index']));
  }

  int get id => _id;

  String get name => _name;

  List<int> get categoriesIndex => _categoriesIndex;
}
