import '../../util/colors.dart';
import 'package:flutter/material.dart';

class Surah extends StatelessWidget {
  final int number;
  final double fontSize;
  final String surah;
  final bool showAlAyat;
  final Function onTap;

  const Surah({
    this.number,
    this.fontSize,
    this.surah,
    this.onTap,
    this.showAlAyat,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: teal[300],
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: teal[200],
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Stack(
          children: <Widget>[
            Align(alignment: Alignment.topRight, child: _buildNumberField()),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 15.0, right: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildNameField(),
                  Icon(
                    showAlAyat
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: teal[700],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
          color: teal[200],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomLeft: Radius.circular(10))),
      child: Text(
        '$number',
        textAlign: TextAlign.center,
        style: new TextStyle(
          color: teal[700],
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        'سورة $surah',
        textAlign: TextAlign.center,
        style: new TextStyle(
          color: teal,
          fontWeight: FontWeight.w700,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
