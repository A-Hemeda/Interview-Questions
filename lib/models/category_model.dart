class CategoryModel {
  int _id, _sectionId, _favorite;
  String _nameWithDiacritics, _nameWithoutDiacritics, _azkarIndex;

  CategoryModel(
    this._id,
    this._sectionId,
    this._nameWithDiacritics,
    this._nameWithoutDiacritics,
    this._favorite,
    this._azkarIndex,
  );

  CategoryModel.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _sectionId = map['section_id'];
    _nameWithDiacritics = map['name_with_diacritics'];
    _nameWithoutDiacritics = map['name_without_diacritics'];
    _favorite = map['favorite'];
    _azkarIndex = map['azkar_index'];
  }

  void setFavorite(int value) {
    _favorite = value;
  }

  int get id => _id;

  int get sectionId => _sectionId;

  String get nameWithDiacritics => _nameWithDiacritics;

  String get nameWithoutDiacritics => _nameWithoutDiacritics;

  int get favorite => _favorite;

  String get azkarIndex => _azkarIndex;
}
