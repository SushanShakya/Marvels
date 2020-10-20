part of 'marvelcharacters_cubit.dart';

@immutable
abstract class MarvelCharactersState {}

class MarvelCharactersInitial extends MarvelCharactersState {}

class MarvelCharactersLoading extends MarvelCharactersState {
  static MarvelCharactersLoading _loading;

  MarvelCharactersLoading._();

  factory MarvelCharactersLoading() {
    if (_loading == null) _loading = MarvelCharactersLoading._();
    return _loading;
  }
}

class MarvelCharactersFailed extends MarvelCharactersState {
  final String message;

  MarvelCharactersFailed(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MarvelCharactersFailed && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class MarvelCharactersSuccess extends MarvelCharactersState {
  final List<MarvelCharacter> characters;

  MarvelCharactersSuccess(this.characters);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MarvelCharactersSuccess && listEquals(o.characters, characters);
  }

  @override
  int get hashCode => characters.hashCode;
}
