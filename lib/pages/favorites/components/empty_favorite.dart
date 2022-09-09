import '../../../util/colors.dart';
import 'package:flutter/material.dart';

class EmptyFavorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: size.width,
          height: size.height * 0.5,
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/icons/favorites/empty.png',
            color: teal[400].withAlpha(200),
            colorBlendMode: BlendMode.modulate,
            fit: BoxFit.contain,
            // height: size.height,
          ),
        ),
        Text(
          'المفضلة فارغة',
          style: new TextStyle(
            color: teal[700],
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
