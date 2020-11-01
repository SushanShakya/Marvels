import 'package:marvels_app/models/api_response.dart';
import 'package:marvels_app/models/marvel_character.dart';

abstract class IRepository {
  Future<ApiResponse<List<MarvelCharacter>>> getAllCharacters();
  Future<ApiResponse<List<MarvelCharacter>>> getCharactersWhoseNameStartsWith(String name);
}
