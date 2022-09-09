import 'package:flutter/material.dart';
import '../../util/colors.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(gray10),
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}
