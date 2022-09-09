class AsmaAllahModel {
  int _id;
  String _name, _description;

  AsmaAllahModel(
    this._id,
    this._name,
    this._description,
  );

  AsmaAllahModel.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _name = map['name'];
    _description = map['description'];
  }

  int get id => _id;

  String get name => _name;

  String get description => _description;
}
