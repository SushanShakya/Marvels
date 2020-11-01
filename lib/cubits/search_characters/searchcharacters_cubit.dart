import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:marvels_app/models/api_response.dart';
import 'package:marvels_app/models/marvel_character.dart';
import 'package:marvels_app/repository/base_repository.dart';
import 'package:meta/meta.dart';

part 'searchcharacters_state.dart';

class SearchCharactersCubit extends Cubit<SearchCharactersState> {
  final IRepository _repository;
  SearchCharactersCubit(this._repository) : super(SearchCharactersInitial());

  Future<void> search(String name) async {
    emit(SearchLoading());
    final data = await _repository.getCharactersWhoseNameStartsWith(name);    
    if (_checkError(data.status))
      emit(SearchError(data.message));
    else
      emit(SearchSuccess(data.data));
  }

  bool _checkError(Status status) {
    if (status == Status.error) return true;
    return false;
  }
}
