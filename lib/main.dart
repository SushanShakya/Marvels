import 'package:flutter/material.dart';
import 'package:marvels_app/screens/home.dart';

void main() => runApp(MarvelsApp());

class MarvelsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Marvel's App",
      theme: ThemeData(primaryColor: Color(0xFF202020)),
      home: Home(),
    );
  }
}
