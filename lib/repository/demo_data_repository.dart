import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:marvels_app/models/api_response.dart';
import 'package:marvels_app/models/marvel_character.dart';
import 'package:marvels_app/repository/base_repository.dart';

class DemoDataRepository implements IRepository {
  @override
  Future<ApiResponse<List<MarvelCharacter>>> getAllCharacters() async {
    String json = await rootBundle.loadString("demo_data/demo_data.json");

    return ApiResponse.success(List<MarvelCharacter>.from(
        jsonDecode(json).map((x) => MarvelCharacter.fromFile(x)).toLIst()));
  }
}
