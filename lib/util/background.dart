import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      height: size.height,
      width: size.width,
      child: Image.asset(
        'assets/images/background/background.png',
        color: Color(0x10003444),
        fit: BoxFit.cover,
        height: size.height,
      ),
    );
  }
}
