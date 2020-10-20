import 'dart:convert';

import 'package:marvels_app/api_key/marvels_api_key.dart';
import 'package:marvels_app/services/custom_exceptions/failed_exception.dart';
import 'package:marvels_app/services/network_service.dart';
import 'package:http/http.dart' as http;

class MarvelNetworkService implements INetworkService {
  final String _baseUrl = "https://gateway.marvel.com:443";

  @override
  Future<Map<String, dynamic>> get(String url) async {
    try {
      final response = await http.get(_baseUrl + url + "?apiKey=" + apiKey,
          headers: {"content-type": "application/json"});
      if (response.statusCode != 200) throw FailedException("Error");
      return jsonDecode(response.body);
    } catch (e) {
      throw FailedException("Error");
    }
  }
}
