import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../util/colors.dart';
import 'package:flutter/material.dart';

class ButtonFontSize extends StatelessWidget {
  final bool showSider;
  final Function onTap;

  ButtonFontSize({
    this.showSider,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'تغيير حجم الخط',
      padding: EdgeInsets.all(0.0),
      highlightColor: Colors.transparent,
      splashColor: teal[700],
      icon: Container(
        padding: EdgeInsets.only(top: 2.5, bottom: 2.5, left: 5.0, right: 5.0),
        decoration: BoxDecoration(
            color: showSider ? teal[50] : Colors.transparent,
            borderRadius: BorderRadius.circular(10)),
        child: FaIcon(
          FontAwesomeIcons.font,
          color: showSider ? teal[800] : teal[50],
          size: 20,
        ),
      ),
      onPressed: onTap,
    );
  }
}
