import 'package:azkar_of_the_muslim/home_module/home_screen.dart';
import 'package:azkar_of_the_muslim/screens/%D8%A3%D8%AF%D8%B9%D9%8A%D8%A9_%D9%85%D9%86_%D8%A7%D9%84%D9%82%D8%B1%D8%A2%D9%86.dart';
import 'package:azkar_of_the_muslim/screens/%D8%A7%D9%84%D8%A5%D8%B3%D8%AA%D9%8A%D9%82%D8%A7%D8%B8.dart';
import 'package:azkar_of_the_muslim/screens/%D8%A7%D9%84%D8%B3%D9%81%D8%B1.dart';
import 'package:azkar_of_the_muslim/screens/%D8%A7%D9%84%D8%B5%D9%84%D8%A7%D8%A9.dart';
import 'package:azkar_of_the_muslim/screens/%D8%A7%D9%84%D8%B7%D8%A8%D9%8A%D8%B9%D8%A9.dart';
import 'package:azkar_of_the_muslim/screens/%D8%A7%D9%84%D8%B7%D8%B9%D8%A7%D9%85.dart';
import 'package:azkar_of_the_muslim/screens/%D8%A7%D9%84%D9%85%D9%86%D8%B2%D9%84.dart';
import 'package:azkar_of_the_muslim/screens/%D8%A7%D9%84%D9%86%D9%88%D9%85.dart';
import 'package:azkar_of_the_muslim/screens/%D9%85%D8%AA%D9%81%D8%B1%D9%82%D8%A9.dart';
import 'package:azkar_of_the_muslim/screens/المساء.dart';
import 'package:azkar_of_the_muslim/screens/الصباح.dart';
import 'package:flutter/material.dart';
import '../screens/الأذان_والمسجد.dart';
import '../screens/الهموم_والأحزان.dart';

class AppRouter {
  static Route<dynamic>? getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case '/Morning':
        return MaterialPageRoute(
          builder: (context) => MorningAzkar(),
        );
      case '/Evening':
        return MaterialPageRoute(
          builder: (context) => EveningAzkar(),
        );
      case '/WakingUp':
        return MaterialPageRoute(
          builder: (context) => WakingUpAzkar(),
        );
      case '/Sleep':
        return MaterialPageRoute(
          builder: (context) => SleepAzkar(),
        );
      case '/Home':
        return MaterialPageRoute(
          builder: (context) => HomeAzkar(),
        );
      case '/Eating':
        return MaterialPageRoute(
          builder: (context) => EatingAzkar(),
        );
      case '/Prayer':
        return MaterialPageRoute(
          builder: (context) => PrayerAzkar(),
        );
      case '/Travel':
        return MaterialPageRoute(
          builder: (context) => TravelAzkar(),
        );
      case '/Mosque':
        return MaterialPageRoute(
          builder: (context) => MosqueAzkar(),
        );
      case '/Nature':
        return MaterialPageRoute(
          builder: (context) => NatureAzkar(),
        );
      case '/Problems':
        return MaterialPageRoute(
          builder: (context) => ProblemsAzkar(),
        );
      case '/Other':
        return MaterialPageRoute(
          builder: (context) => OtherAzkar(),
        );
      case '/Quran':
        return MaterialPageRoute(
          builder: (context) => Quran(),
        );
    }
  }
}
