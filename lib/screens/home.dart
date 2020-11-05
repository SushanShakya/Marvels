import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvels_app/cubits/marvel_characters/marvelcharacters_cubit.dart';
import 'package:marvels_app/cubits/search_characters/searchcharacters_cubit.dart';
import 'package:marvels_app/screens/widgets/characters_grid.dart';
import 'package:marvels_app/search/marvel_search_delegate.dart';

class Home extends StatelessWidget {
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
                  "images/background.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              actions: [
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      final bloc = context.bloc<SearchCharactersCubit>();
                      showSearch(
                          context: context,
                          delegate: MarvelSearchDelegate(bloc));
                    })
              ],
              floating: true,
              centerTitle: true,
            )
          ];
        },
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<MarvelCharactersCubit, MarvelCharactersState>(
      builder: (context, state) {
        if (state is MarvelCharactersFailed)
          return _buildFailed(context, state.message);

        if (state is MarvelCharactersSuccess) {
          return CharactersGrid(characters: state.characters);
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
