import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvels_app/models/marvel_character.dart';
import 'package:marvels_app/screens/character_detail.dart';

class CharactersGrid extends StatelessWidget {
  final List<MarvelCharacter> characters;

  const CharactersGrid({Key key, @required this.characters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
        physics: BouncingScrollPhysics(),
        itemCount: characters.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 11 / 16,
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0),
        itemBuilder: (context, index) {
          MarvelCharacter character = characters[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, a, b) => CharacterDetailScreen(
                            characters: characters,
                            index: index,
                          )));
            },
            child: Card(
              color: Colors.black,
              shape: BeveledRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(20.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      child: Hero(
                        tag: character.id,
                        child: CachedNetworkImage(
                            imageUrl: character.image, fit: BoxFit.fitHeight),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 5.0,
                    color: Colors.red,
                    height: 0.0,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            character.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "RobotoCondensed",
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
