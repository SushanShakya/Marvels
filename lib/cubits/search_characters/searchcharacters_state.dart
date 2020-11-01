part of 'searchcharacters_cubit.dart';

@immutable
abstract class SearchCharactersState {}

class SearchCharactersInitial extends SearchCharactersState {}

class SearchLoading extends SearchCharactersState {
  static SearchLoading _loading;

  SearchLoading._();

  factory SearchLoading() {
    if (_loading == null) _loading = SearchLoading._();
    return _loading;
  }
}

class SearchError extends SearchCharactersState {
  final String message;

  SearchError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SearchError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class SearchSuccess extends SearchCharactersState {
  final List<MarvelCharacter> characters;

  SearchSuccess(this.characters);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is SearchSuccess &&
      listEquals(o.characters, characters);
  }

  @override
  int get hashCode => characters.hashCode;
}
