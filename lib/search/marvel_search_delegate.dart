import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvels_app/cubits/search_characters/searchcharacters_cubit.dart';

import 'package:marvels_app/screens/widgets/characters_grid.dart';

class MarvelSearchDelegate extends SearchDelegate {
  final SearchCharactersCubit cubit;

  MarvelSearchDelegate(this.cubit);

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return theme.copyWith(
        textTheme: TextTheme(
            headline6: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto Condensed",
                fontSize: 18.0)));
  }

  @override
  void showResults(BuildContext context) {
    cubit.search(query);
    super.showResults(context);
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
          }),
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  void showSuggestions(BuildContext context) {}

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
    return BlocConsumer<SearchCharactersCubit, SearchCharactersState>(
      cubit: cubit,
      listener: (context, state) {
        if (state is SearchLoading) print("Loading");
        if (state is SearchError) print(state.message);
        if (state is SearchSuccess) print(state.characters);
      },
      builder: (context, state) {
        if (state is SearchLoading) return _buildLoading();
        if (state is SearchError) return _buildError(state.message);
        if (state is SearchSuccess)
          return CharactersGrid(
            characters: state.characters,
          );

        return Container();
      },
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
