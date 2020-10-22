import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvels_app/screens/home.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Home(),
      bottomNavigationBar: Container(
        height: kToolbarHeight - 10.0,
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _navItem(Icons.dashboard_outlined, () {}),
            _navItem(Icons.search_outlined, () {}),
            _navItem(Icons.library_books_outlined, () {}),
            _navItem(Icons.exit_to_app_outlined, () {
              showDialog(
                  context: context,
                  child: AlertDialog(
                    backgroundColor: Theme.of(context).primaryColor,
                    title: Text(
                      "Quit ?",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "RobotoCondensed",
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold),
                    ),
                    content: Text(
                      "Are you sure you want to exit ?",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.0,
                        fontFamily: "RobotoCondensed",
                      ),
                    ),
                    actions: [
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text(
                            "No",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "RobotoCondensed",
                            ),
                          )),
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text(
                            "Yes",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "RobotoCondensed",
                            ),
                          )),
                    ],
                  )).then((value) => value ? SystemNavigator.pop() : () {});
            }),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, Function onPressed) {
    return FlatButton(
        onPressed: onPressed,
        child: Icon(
          icon,
          color: Colors.white,
          // size: 10.0,
        ));
  }
}
