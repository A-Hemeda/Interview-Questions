class FavoriteModel {
  int _id, _itemId;

  FavoriteModel(
    this._id,
    this._itemId,
  );

  FavoriteModel.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _itemId = map['item_id'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'item_id': _itemId,
    };
  }

  int get id => _id;

  int get itemId => _itemId;
}
