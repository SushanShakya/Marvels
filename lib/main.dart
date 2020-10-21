import 'package:flutter/material.dart';

import 'package:marvels_app/screens/main_screen.dart';

void main() => runApp(MarvelsApp());

class MarvelsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Marvel's App",
      theme: ThemeData(
          primaryColor: Color(0xFF202020),
          bottomAppBarTheme: BottomAppBarTheme(color: Color(0xFF202020)),
          buttonTheme: ButtonThemeData(
            padding: EdgeInsets.all(5.0)
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Color(0xFF202020),
              // selectedLabelStyle: TextStyle(color: Colors.red),
              // unselectedLabelStyle: TextStyle(color: Colors.white),
              showUnselectedLabels: true,
              unselectedIconTheme: IconThemeData(color: Colors.white),
              selectedIconTheme: IconThemeData(
                color: Colors.red,
              )),
          primaryIconTheme: IconThemeData(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white)),
      home: MainScreen(),
    );
  }
}
