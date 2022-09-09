import 'package:azkark/util/colors.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 40),
      height: size.height * 0.3,
      width: size.width,
      child: Image.asset(
        'assets/images/icons/not_fount/no_found.png',
        fit: BoxFit.contain,
        color: teal[300].withAlpha(200),
        colorBlendMode: BlendMode.modulate,
        height: size.height * 0.4,
      ),
    );
  }
}
