import 'package:marvels_app/services/custom_exceptions/failed_exception.dart';
import 'package:marvels_app/services/network/marvel_network_service.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as https;

class MockHttp extends Mock implements https.Client {}

void main() {
  group("MarvelsNetworkService", () {
    MockHttp http;
    MarvelNetworkService service;

    setUp(() {
      http = MockHttp();
      service = MarvelNetworkService();
    });

    tearDown(() {
      clearInteractions(http);
      reset(http);
      http = null;
      service = null;
    });

    final exception = FailedException("Error");

    group("get()", () {
      final String _baseUrl = "https://gateway.marvel.com";
      getErrorCall(String url, Exception exception) {
        when(http.get(argThat(startsWith(_baseUrl + url)))).thenThrow(exception);
      }

      getCall(String url, https.Response response) {
        when(http.get(argThat(startsWith(_baseUrl + url))))
            .thenAnswer((realInvocation) async => response);
      }

      test("throws FailedException when error", () {
        final expected = "Error";

        getErrorCall("/v1/public/characters", exception);

        service
            .get("/v1/public/characters")
            .catchError((e) => expect(e.toString(), expected));
      });
      test("throws FailedException when status code is not 200", () {
        final expected = "Error";

        getCall("/v1/public/characters", https.Response("{}", 201));

        service
            .get("/v1/public/characters")
            .catchError((e) => expect(e.toString(), expected));
      });
      test("returns Map<String,dynamic> response when everything fine", () {
        final expected = "Error";

        getCall("/v1/public/characters", https.Response("{}", 200));

        service
            .get("/v1/public/characters")
            .catchError((e) => expect(e, expected));
      });
    });
  });
}
