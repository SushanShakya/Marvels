import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvels_app/cubits/search_characters/searchcharacters_cubit.dart';
import 'package:marvels_app/repository/marvels_api_repository.dart';
import 'package:marvels_app/screens/widgets/characters_grid.dart';
import 'package:marvels_app/services/network/marvel_network_service.dart';

class MarvelSearchDelegate extends SearchDelegate {
  final cubit =
      SearchCharactersCubit(MarvelsApiRepository(MarvelNetworkService()));

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return theme.copyWith(appBarTheme: AppBarTheme());
  }

  @override
  TextStyle get searchFieldStyle => TextStyle(color: Colors.white);

  @override
  String get searchFieldLabel => "Search Characters";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            cubit.search(query);
            showResults(context);
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<SearchCharactersCubit, SearchCharactersState>(
        builder: (context, state) {
          if (state is SearchError) return _buildError(state.message);
          if (state is SearchSuccess)
            return CharactersGrid(
              characters: state.characters,
            );

          return _buildLoading();
        },
      ),
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Text(message),
    );
  }

  Widget _buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
