import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:marvels_app/api_key/marvels_api_key.dart';
import 'package:marvels_app/services/custom_exceptions/failed_exception.dart';
import 'package:marvels_app/services/network/network_service.dart';
import 'package:http/http.dart' as http;

class MarvelNetworkService implements INetworkService {
  final String _baseUrl = "http://gateway.marvel.com";

  @override
  Future<Map<String, dynamic>> get(String url) async {
    try {
      print(md5.convert(utf8.encode(privateKey + publicKey)).toString());

      print(DateTime.now().millisecondsSinceEpoch.toString());

      final response = await http.get(
          _baseUrl +
              url +
              "?ts=" +
              DateTime.now().millisecondsSinceEpoch.toString() +
              "&apiKey=" +
              publicKey +
              "&hash=" +
              md5.convert(utf8.encode(privateKey + publicKey)).toString(),
          headers: {"content-type": "application/json"});

      return _getResponse(response);
    } catch (e) {
      throw FailedException(e.toString());
    }
  }

  Map<String, dynamic> _getResponse(http.Response response) {
    print(response.body);
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 409:
        throw FailedException(jsonDecode(response.body)["code"] +
            " " +
            jsonDecode(response.body)["message"]);
      case 401:
        throw FailedException("Invalid Hash !");
      case 405:
        throw FailedException("Method Not Allowed !");
      case 403:
        throw FailedException("Forbidden");
      default:
        throw FailedException("Could Not fetch data from server !");
    }
  }
}
