import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvels_app/models/marvel_character.dart';
import 'package:url_launcher/url_launcher.dart';

class CharacterDetailScreen extends StatefulWidget {
  final List<MarvelCharacter> characters;
  final int index;

  CharacterDetailScreen({Key key, this.characters, this.index})
      : super(key: key);

  @override
  _CharacterDetailScreenState createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Image.asset(
          "images/splash.png",
          height: 100,
        ),
      ),
      bottomNavigationBar: Container(
        height: kToolbarHeight - 10,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlatButton(
                onPressed: () {
                  controller.previousPage(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.ease);
                },
                child: Text(
                  "Previous",
                  style: TextStyle(
                    letterSpacing: 1.0,
                    color: Colors.white,
                    fontFamily: "RobotoCondensed",
                  ),
                )),
            FlatButton(
                onPressed: () {
                  controller.nextPage(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.ease);
                },
                child: Text("Next",
                    style: TextStyle(
                      letterSpacing: 1.0,
                      color: Colors.white,
                      fontFamily: "RobotoCondensed",
                    )))
          ],
        ),
      ),
      body: PageView.builder(
          physics: BouncingScrollPhysics(),
          controller: controller,
          itemBuilder: (context, index) {
            MarvelCharacter hero = widget.characters[index];

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        color: Colors.black,
                        child: Hero(
                          tag: hero.id,
                          child: CachedNetworkImage(
                            imageUrl: hero.image,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                            child: Text(
                          hero.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "RobotoCondensed",
                              fontSize: 18.0,
                              letterSpacing: 1.0),
                        )),
                      ))
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    physics: BouncingScrollPhysics(),
                    children: [
                      _detail(
                          context,
                          "Description",
                          Text(
                              hero.description == ""
                                  ? "No description given"
                                  : hero.description,
                              style: TextStyle(
                                  fontFamily: "RobotoCondensed",
                                  height: 1.2,
                                  letterSpacing: 0.5))),
                      _detail(
                          context,
                          "Links",
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: hero.urls.map((e) => _link(e)).toList(),
                          ))
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }

  Widget _link(Url url) {
    return InkWell(
      onTap: () => _launchUrl(url.url),
      child: Column(
        children: [
          Image.asset(
            "images/${url.type}.png",
            height: 40.0,
          ),
          Text(url.type)
        ],
      ),
    );
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {}
  }

  Widget _detail(BuildContext context, String title, Widget child) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Theme.of(context).primaryColor))),
              child: Text(
                title.toUpperCase(),
                style: TextStyle(
                    fontFamily: "RobotoCondensed",
                    fontSize: 18.0,
                    letterSpacing: 2.0),
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 20.0,
            ),
            Expanded(child: child)
          ],
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
