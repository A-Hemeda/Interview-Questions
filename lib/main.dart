import 'package:azkar/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Color(0xff103030),
              // ignore: deprecated_member_use
              textTheme: TextTheme(
                  headline6: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 24.0,
              )),
              centerTitle: true,
              elevation: 0),
          scaffoldBackgroundColor: Colors.white),
    );
  }
}
