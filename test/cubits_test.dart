import 'package:bloc_test/bloc_test.dart';
import 'package:marvels_app/cubits/search_characters/searchcharacters_cubit.dart';
import 'package:marvels_app/cubits/marvel_characters/marvelcharacters_cubit.dart';
import 'package:marvels_app/models/api_response.dart';
import 'package:marvels_app/models/marvel_character.dart';
import 'package:marvels_app/repository/base_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockRepository extends Mock implements IRepository {}

void main() {
  group("MarvelCharactersCubit", () {
    MockRepository repo;
    MarvelCharactersCubit cubit;

    setUp(() {
      repo = MockRepository();
      cubit = MarvelCharactersCubit(repo);
    });

    tearDown(() {
      clearInteractions(repo);
      reset(repo);
      repo = null;
      cubit = null;
    });

    blocTest("emits nothing at initial", build: () => cubit, expect: []);
    blocTest("emits loading and then failed state if error occurs",
        build: () {
          when(repo.getAllCharacters()).thenAnswer((realInvocation) async =>
              ApiResponse<List<MarvelCharacter>>.error("Failed to Load data"));
          return cubit;
        },
        act: (MarvelCharactersCubit cubit) => cubit.getAllCharacters(),
        expect: [
          MarvelCharactersLoading(),
          MarvelCharactersFailed("Failed to Load data")
        ]);
    blocTest("emits loading and then success state if everything fine",
        build: () {
          when(repo.getAllCharacters()).thenAnswer((realInvocation) async =>
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
              ]));
          return cubit;
        },
        act: (MarvelCharactersCubit cubit) => cubit.getAllCharacters(),
        expect: [
          MarvelCharactersLoading(),
          MarvelCharactersSuccess([
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
          ])
        ]);
  });

  group("SearchCharacterCubit", () {
    MockRepository repo;
    SearchCharactersCubit cubit;

    setUp(() {
      repo = MockRepository();
      cubit = SearchCharactersCubit(repo);
    });

    tearDown(() {
      clearInteractions(repo);
      reset(repo);
      repo = null;
      cubit = null;
    });

    blocTest("throws nothing as initial", build: () => cubit, expect: []);

    blocTest("throws Loading and Error when load error",
        build: () {
          when(repo.getCharactersWhoseNameStartsWith("Cap")).thenAnswer(
              (realInvocation) async =>
                  ApiResponse<List<MarvelCharacter>>.error("Failed"));
          return cubit;
        },
        act: (SearchCharactersCubit c) => c.search("Cap"),
        expect: [SearchLoading(), SearchError("Failed")]);

    blocTest("emits loading and then success state if everything fine",
        build: () {
          when(repo.getCharactersWhoseNameStartsWith("3-D")).thenAnswer(
              (realInvocation) async =>
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
                  ]));
          return cubit;
        },
        act: (SearchCharactersCubit cubit) => cubit.search("3-D"),
        expect: [
          SearchLoading(),
          SearchSuccess([
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
          ])
        ]);
  });
}
