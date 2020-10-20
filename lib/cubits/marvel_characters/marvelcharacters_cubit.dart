import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:marvels_app/models/api_response.dart';
import 'package:marvels_app/models/marvel_character.dart';
import 'package:marvels_app/repository/base_repository.dart';
import 'package:meta/meta.dart';

part 'marvelcharacters_state.dart';

class MarvelCharactersCubit extends Cubit<MarvelCharactersState> {
  final IRepository _repository;
  MarvelCharactersCubit(this._repository) : super(MarvelCharactersInitial());

  void getAllCharacters() {
    emit(MarvelCharactersLoading());
    _repository.getAllCharacters().then((value) => (_checkError(value.status)
        ? emit(MarvelCharactersFailed(value.message))
        : emit(MarvelCharactersSuccess(value.data))));
  }

  bool _checkError(Status status) {
    if (status == Status.error) return true;
    return false;
  }
}
