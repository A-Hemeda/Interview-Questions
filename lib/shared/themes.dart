import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const primaryColor = Colors.teal;
const myWhite = Colors.white;
const Color scaffoldColor = Colors.white;

ThemeData lightMode = ThemeData(
  fontFamily: 'Cairo',
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black12,
      statusBarIconBrightness: Brightness.dark,
    ),
    color: primaryColor,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: 'Cairo',
      color: Colors.white,
      fontSize: 21,
      fontWeight: FontWeight.bold,
    ),
  ),
  scaffoldBackgroundColor: scaffoldColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: primaryColor,
    unselectedItemColor: Colors.black45,
    backgroundColor: Colors.white54,
    elevation: 50,
  ),
);
