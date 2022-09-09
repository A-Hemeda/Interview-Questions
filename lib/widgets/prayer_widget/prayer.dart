import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/prayer_provider.dart';
import 'surah.dart';
import 'alayat.dart';

class Prayer extends StatelessWidget {
  final double fontSize;
  final bool showAlAyat;
  final int surahNumber;
  final Function onTap;

  Prayer({
    this.fontSize,
    this.surahNumber,
    this.onTap,
    this.showAlAyat,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final prayerProvider = Provider.of<PrayerProvider>(context, listen: false);

    return Container(
      width: size.width,
      child: Column(
        children: <Widget>[
          Surah(
            fontSize: fontSize,
            number: surahNumber + 1,
            surah: prayerProvider.allSurah[surahNumber],
            onTap: onTap,
            showAlAyat: showAlAyat,
          ),
          if (showAlAyat)
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: AlAyat(
                fontSize: fontSize,
                surah: prayerProvider.allSurah[surahNumber],
              ),
            ),
        ],
      ),
    );
  }
}
