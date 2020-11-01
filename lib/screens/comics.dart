import 'package:flutter/material.dart';

class Comics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 0.0,
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height / 3,
              titleSpacing: 0.0,
              title: Image.asset(
                "images/splash.png",
                height: 100,
              ),
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "images/comicBg.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
              floating: true,
              centerTitle: true,
            )
          ];
        },
        body: Container(),
      ),
    );
  }
}
