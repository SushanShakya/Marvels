import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvels_app/screens/home.dart';

void main() {
  testWidgets("Home Screen has a List View", (WidgetTester tester) async {
    await tester.pumpWidget(Home());

    final titleFinder = find.text("Marvels Characters");
  });
}
