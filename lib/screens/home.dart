import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvels_app/cubits/marvel_characters/marvelcharacters_cubit.dart';
import 'package:marvels_app/repository/marvels_api_repository.dart';
import 'package:marvels_app/screens/widgets/characters_grid.dart';
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
                    IconButton(icon: Icon(Icons.search), onPressed: () {})
                  ],
                  floating: true,
                  centerTitle: true,
                )
              ];
            },
            body: _buildBody(context),
          ),
        ));
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
