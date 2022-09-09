class ZekrModel {
  int _id, _categoryId, _counterNumber;
  String _textWithDiacritics, _textWithoutDiacritics, _sanad, _counterText;

  ZekrModel(
    this._id,
    this._categoryId,
    this._counterNumber,
    this._textWithDiacritics,
    this._textWithoutDiacritics,
    this._sanad,
    this._counterText,
  );

  ZekrModel.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _categoryId = map['category_id'];
    _textWithDiacritics = map['text_with_diacritics'];
    _textWithoutDiacritics = map['text_without_diacritics'];
    _sanad = map['sanad'];
    _counterText = map['counter_text'];
    _counterNumber = map['counter_number'];
  }

  int get id => _id;

  int get categoryId => _categoryId;

  String get textWithDiacritics => _textWithDiacritics;

  get textWithoutDiacritics => _textWithoutDiacritics;

  String get sanad => _sanad;

  String get counterText => _counterText;

  int get counterNumber => _counterNumber;
}
