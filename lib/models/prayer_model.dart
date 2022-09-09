class PrayerModel {
  int _id, _ayaNumber, _favorite;
  String _surah, _aya;

  PrayerModel(
    this._id,
    this._surah,
    this._ayaNumber,
    this._aya,
    this._favorite,
  );

  PrayerModel.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _surah = map['surah'];
    _ayaNumber = map['aya_number'];
    _aya = map['aya'];
    _favorite = map['favorite'];
  }

  void setFavorite(int value) {
    _favorite = value;
  }

  int get id => _id;

  String get surah => _surah;

  int get ayaNumber => _ayaNumber;

  String get aya => _aya;

  int get favorite => _favorite;
}
