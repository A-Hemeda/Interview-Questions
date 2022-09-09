import 'dart:math';
import 'package:azkark/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import '../../util/colors.dart';
import 'package:flutter/material.dart';

class SettingFontType extends StatefulWidget {
  final BorderRadius borderRadius;

  const SettingFontType({this.borderRadius});

  @override
  _SettingFontTypeState createState() => _SettingFontTypeState();
}

class _SettingFontTypeState extends State<SettingFontType>
    with SingleTickerProviderStateMixin {
  bool _showBoxFonts;
  int _fontType;
  AnimationController _animationController;
  Animation<double> _heightAnimation, _arrowAnimation;

  @override
  void initState() {
    super.initState();
    _fontType = Provider.of<SettingsProvider>(context, listen: false)
        .getsettingField('font_family');
    _showBoxFonts = false;
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _heightAnimation =
        Tween<double>(begin: 0, end: 300).animate(_animationController);

    _arrowAnimation = Tween(begin: 0.0, end: pi).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildTitle(),
        _buildBodyButton(size),
      ],
    );
  }

  Widget _buildTitle() {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: teal[200],
      borderRadius: widget.borderRadius,
      onTap: () {
        setState(() {
          _showBoxFonts = !_showBoxFonts;
          _showBoxFonts
              ? _animationController.forward()
              : _animationController.reverse();
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'نوع الخط',
              style: new TextStyle(
                color: teal,
                fontSize: 14,
              ),
            ),
            AnimatedBuilder(
                animation: _animationController,
                builder: (context, widget) {
                  return Transform.rotate(
                    angle: _arrowAnimation.value,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: teal[700],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyButton(Size size) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, widget) {
          return Container(
            height: _heightAnimation.value,
            margin: EdgeInsets.all(10),
            foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: teal[600])),
            // color: ruby,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildPreviewBox(size),
                  _buildFontsBox(size),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildPreviewBox(Size size) {
    return Container(
      width: size.width,
      height: 50,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: teal[200],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Center(
        child: Text(
          'بسم الله الرَّحْمَنِ الرَّحِيمِ',
          style: new TextStyle(
            fontFamily: _fontType.toString(),
            color: teal[500],
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildFontsBox(Size size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildFontContainer('الخط الإفتراضي', '0', size),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildFontContainer('الخط ١', '1', size),
                _buildFontContainer('الخط ٢', '2', size),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildFontContainer('الخط ٣', '3', size),
                _buildFontContainer('الخط ٤', '4', size),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildFontContainer('الخط ٥', '5', size),
                _buildFontContainer('الخط ٦', '6', size),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildFontContainer('الخط ٧', '7', size),
                _buildFontContainer('الخط ٨', '8', size),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFontContainer(String name, String font, Size size) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: teal[200],
      borderRadius: BorderRadius.circular(15),
      onTap: () async {
        setState(() {
          _fontType = int.parse(font);
        });
        await Provider.of<SettingsProvider>(context, listen: false)
            .updateSettings('font_family', _fontType);
      },
      child: Container(
        height: 35,
        width: font == '0' ? null : size.width * 0.3,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: font == _fontType.toString() ? teal[500] : gray20,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                '$name',
                style: TextStyle(
                  color:
                      font == _fontType.toString() ? Colors.white : teal[500],
                  fontFamily: font,
                  fontSize: 14,
                ),
              ),
            ),
            Icon(
              font == _fontType.toString()
                  ? Icons.check_circle
                  : Icons.check_circle_outline,
              color: font == _fontType.toString() ? Colors.white : gray20,
            ),
          ],
        ),
      ),
    );
  }
}
