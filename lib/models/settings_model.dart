class SettingsModel {
  int _counter, _diacritics, _sanad, _fontFamily;
  double _fontSize;

  SettingsModel(
    this._counter,
    this._diacritics,
    this._sanad,
    this._fontFamily,
    this._fontSize,
  );

  SettingsModel.fromMap(Map<String, dynamic> map) {
    _counter = map['counter'];
    _diacritics = map['diacritics'];
    _sanad = map['sanad'];
    _fontFamily = map['font_family'];
    _fontSize = map['font_size'];
  }

  void setCounter(int value) {
    _counter = value;
  }

  void setDiacritics(int value) {
    _diacritics = value;
  }

  void setSanad(int value) {
    _sanad = value;
  }

  void setFontFamily(int value) {
    _fontFamily = value;
  }

  void setFontSize(double value) {
    _fontSize = value;
  }

  int get counter => _counter;

  int get diacritics => _diacritics;

  int get sanad => _sanad;

  int get fontFamily => _fontFamily;

  double get fontSize => _fontSize;
}
