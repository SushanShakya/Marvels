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

  List<MarvelCharacter> characters;

  @override
  void initState() {
    super.initState();
    cubit = MarvelCharactersCubit(MarvelsApiRepository(MarvelNetworkService()));
    cubit.getAllCharacters();
    characters = [
      MarvelCharacter(
          id: 1011334,
          name: "3-D Man",
          description: "",
          image:
              "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg",
          urls: <Url>[
            Url(
                type: "detail",
                url:
                    "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=6a9451a902cf5312d49d9b2b6426009d"),
            Url(
                type: "wiki",
                url:
                    "http://marvel.com/universe/3-D_Man_(Chandler)?utm_campaign=apiRef&utm_source=6a9451a902cf5312d49d9b2b6426009d"),
            Url(
                type: "comiclink",
                url:
                    "http://marvel.com/comics/characters/1011334/3-d_man?utm_campaign=apiRef&utm_source=6a9451a902cf5312d49d9b2b6426009d")
          ]),
      MarvelCharacter(
          id: 1017100,
          name: "A-Bomb (HAS)",
          description: "",
          image:
              "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16.jpg",
          urls: <Url>[
            Url(
                type: "detail",
                url:
                    "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=6a9451a902cf5312d49d9b2b6426009d"),
            Url(
                type: "wiki",
                url:
                    "http://marvel.com/universe/3-D_Man_(Chandler)?utm_campaign=apiRef&utm_source=6a9451a902cf5312d49d9b2b6426009d"),
            Url(
                type: "comiclink",
                url:
                    "http://marvel.com/comics/characters/1011334/3-d_man?utm_campaign=apiRef&utm_source=6a9451a902cf5312d49d9b2b6426009d")
          ])
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        body: _buildSlivers(context),
      ),
    );
  }

  Widget _buildSlivers(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
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
        ),
        SliverPadding(
          padding: EdgeInsets.all(10.0),
          sliver: SliverToBoxAdapter(
            child: BlocBuilder<MarvelCharactersCubit, MarvelCharactersState>(
              builder: (context, state) {
                if (state is MarvelCharactersFailed)
                  return _buildFailed(context, state.message);
                if (state is MarvelCharactersSuccess)
                  return SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        MarvelCharacter character = characters[index];
                        return Card(
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(character.image),
                              )
                            ],
                          ),
                        );
                      }, childCount: characters.length),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 11 / 16,
                          crossAxisCount: 2,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0));

                return _buildLoading();
              },
            ),
          ),
        )
      ],
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
