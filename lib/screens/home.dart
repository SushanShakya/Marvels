import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvels_app/cubits/marvel_characters/marvelcharacters_cubit.dart';

import 'package:marvels_app/models/marvel_character.dart';
import 'package:marvels_app/repository/marvels_api_repository.dart';
import 'package:marvels_app/services/network/marvel_network_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MarvelCharactersCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = MarvelCharactersCubit(MarvelsApiRepository(MarvelNetworkService()));
    cubit.getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => cubit,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0.0,
                  expandedHeight: MediaQuery.of(context).size.height / 3,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      "images/background.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  floating: true,
                  centerTitle: true,
                )
              ];
            },
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildBody(context),
            ),
          ),
        ));
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<MarvelCharactersCubit, MarvelCharactersState>(
      builder: (context, state) {
        if (state is MarvelCharactersFailed)
          return _buildFailed(context, state.message);

        if (state is MarvelCharactersSuccess) {
          return GridView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: state.characters.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 11 / 16,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0),
              itemBuilder: (context, index) {
                MarvelCharacter character = state.characters[index];
                return Card(
                  color: Colors.black,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          child: CachedNetworkImage(
                              imageUrl: character.image, fit: BoxFit.fitHeight),
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
                );
              });
        }

        return _buildLoading();
      },
    );
  }

  _buildFailed(BuildContext context, String message) {
    return Column(
      children: [
        Text(message),
        FlatButton(
            onPressed: () {
              context.bloc<MarvelCharactersCubit>().getAllCharacters();
            },
            child: Text("Retry"))
      ],
    );
  }

  _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
