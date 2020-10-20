import 'package:marvels_app/models/api_response.dart';
import 'package:marvels_app/models/marvel_character.dart';
import 'package:test/test.dart';

void main() {
  test("ApiResponse with error Constructor and same parameter are same", () {
    ApiResponse response = ApiResponse.error("Shit");
    ApiResponse response1 = ApiResponse.error("Shit");

    expect(response == response1, true);
  });

  test("ApiResponse with success Constructor and String parameter are same",
      () {
    ApiResponse<String> response = ApiResponse<String>.success("something");
    ApiResponse<String> response1 = ApiResponse<String>.success("something");

    expect(response == response1, true);
  });

  test("ApiResponse with success Constructor and List parameter are not same",
      () {
    ApiResponse<List<MarvelCharacter>> response =
        ApiResponse<List<MarvelCharacter>>.success([
      MarvelCharacter(
          id: 1011334,
          name: "3-D Man",
          description: "",
          image:
              "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg",
          urls: <Url>[
            Url(
                type: "detail",
                url:
                    "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=6a9451a902cf5312d49d9b2b6426009d"),
            Url(
                type: "wiki",
                url:
                    "http://marvel.com/universe/3-D_Man_(Chandler)?utm_campaign=apiRef&utm_source=6a9451a902cf5312d49d9b2b6426009d"),
            Url(
                type: "comiclink",
                url:
                    "http://marvel.com/comics/characters/1011334/3-d_man?utm_campaign=apiRef&utm_source=6a9451a902cf5312d49d9b2b6426009d")
          ])
    ]);
    ApiResponse<List<MarvelCharacter>> response1 =
        ApiResponse<List<MarvelCharacter>>.success([
      MarvelCharacter(
          id: 1011334,
          name: "3-D Man",
          description: "",
          image:
              "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg",
          urls: <Url>[
            Url(
                type: "detail",
                url:
                    "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=6a9451a902cf5312d49d9b2b6426009d"),
            Url(
                type: "wiki",
                url:
                    "http://marvel.com/universe/3-D_Man_(Chandler)?utm_campaign=apiRef&utm_source=6a9451a902cf5312d49d9b2b6426009d"),
            Url(
                type: "comiclink",
                url:
                    "http://marvel.com/comics/characters/1011334/3-d_man?utm_campaign=apiRef&utm_source=6a9451a902cf5312d49d9b2b6426009d")
          ])
    ]);

    expect(response == response1, false);
  });
}
