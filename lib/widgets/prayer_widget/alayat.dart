import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'aya.dart';
import '../../providers/prayer_provider.dart';

class AlAyat extends StatelessWidget {
  final String surah;
  final double fontSize;

  AlAyat({
    this.surah,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final prayerProvider = Provider.of<PrayerProvider>(context, listen: false);

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: prayerProvider.getAyatSurah(surah).length,
      itemBuilder: (context, index) {
        return Aya(
          prayer: prayerProvider
              .getPrayer(prayerProvider.getAyaOfSurah(surah, index)),
          fontSize: fontSize,
        );
      },
    );
  }
}
