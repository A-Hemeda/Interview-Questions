import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData appTheme(BuildContext context) {
    return ThemeData(
      fontFamily: '0',
      primarySwatch: Colors.teal,
      primaryColor: Colors.teal,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
            brightness: Brightness.dark,
          ),
    );
  }
}
