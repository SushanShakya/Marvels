import 'package:flutter/material.dart';
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
            _navItem(Icons.dashboard_outlined),
            _navItem(Icons.search_outlined),
            _navItem(Icons.library_books_outlined),
            _navItem(Icons.exit_to_app_outlined),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon) {
    return FlatButton(
        onPressed: () {},
        child: Icon(
          icon,
          color: Colors.white,
          // size: 10.0,
        ));
  }
}
