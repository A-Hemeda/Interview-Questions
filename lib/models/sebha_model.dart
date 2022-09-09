class SebhaModel {
  int _id, _counter, _favorite;
  String _name;

  SebhaModel(
    this._id,
    this._name,
    this._counter,
    this._favorite,
  );

  SebhaModel.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _name = map['name'];
    _counter = map['counter'];
    _favorite = map['favorite'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'name': _name,
      'counter': _counter,
      'favorite': _favorite,
    };
  }

  void setId(int value) {
    _id = value;
  }

  set setName(String value) {
    _name = value;
  }

  set setCounter(int value) {
    _counter = value;
  }

  void setFavorite(int value) {
    _favorite = value;
  }

  int get id => _id;

  String get name => _name;

  int get counter => _counter;

  int get favorite => _favorite;
}
