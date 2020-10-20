import 'package:marvels_app/models/api_response.dart';
import 'package:marvels_app/models/marvel_character.dart';
import 'package:marvels_app/repository/base_repository.dart';
import 'package:marvels_app/services/network/network_service.dart';

class MarvelsApiRepository implements IRepository {
  INetworkService _service;

  MarvelsApiRepository(this._service);

  @override
  Future<ApiResponse<List<MarvelCharacter>>> getAllCharacters() async {
    try {
      final response = await _service.get("/v1/public/characters");
      return ApiResponse<List<MarvelCharacter>>.success(
          List<MarvelCharacter>.from(response['data']['results']
              .map((e) => MarvelCharacter.fromMap(e))));
    } catch (e) {
      return ApiResponse<List<MarvelCharacter>>.error(e.toString());
    }
  }
}
