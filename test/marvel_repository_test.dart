import 'dart:convert';

import 'package:marvels_app/models/api_response.dart';
import 'package:marvels_app/models/marvel_character.dart';
import 'package:marvels_app/repository/marvels_api_repository.dart';
import 'package:marvels_app/services/custom_exceptions/failed_exception.dart';
import 'package:marvels_app/services/network_service.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockService extends Mock implements INetworkService {}

final fakeCharactersResponse = {
  "code": 200,
  "status": "Ok",
  "copyright": "© 2020 MARVEL",
  "attributionText": "Data provided by Marvel. © 2020 MARVEL",
  "attributionHTML":
      "<a href=\"http://marvel.com\">Data provided by Marvel. © 2020 MARVEL</a>",
  "etag": "6c14531f3776ae6efa69955ca91f277f01c63eba",
  "data": {
    "offset": 0,
    "limit": 20,
    "total": 1493,
    "count": 20,
    "results": [
      {
        "id": 1011334,
        "name": "3-D Man",
        "description": "",
        "modified": "2014-04-29T14:18:17-0400",
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
          "extension": "jpg"
        },
        "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011334",
        "comics": {
          "available": 12,
          "collectionURI":
              "http://gateway.marvel.com/v1/public/characters/1011334/comics",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/21366",
              "name": "Avengers: The Initiative (2007) #14"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/24571",
              "name": "Avengers: The Initiative (2007) #14 (SPOTLIGHT VARIANT)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/21546",
              "name": "Avengers: The Initiative (2007) #15"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/21741",
              "name": "Avengers: The Initiative (2007) #16"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/21975",
              "name": "Avengers: The Initiative (2007) #17"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/22299",
              "name": "Avengers: The Initiative (2007) #18"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/22300",
              "name": "Avengers: The Initiative (2007) #18 (ZOMBIE VARIANT)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/22506",
              "name": "Avengers: The Initiative (2007) #19"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/8500",
              "name": "Deadpool (1997) #44"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/10223",
              "name": "Marvel Premiere (1972) #35"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/10224",
              "name": "Marvel Premiere (1972) #36"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/10225",
              "name": "Marvel Premiere (1972) #37"
            }
          ],
          "returned": 12
        },
        "series": {
          "available": 3,
          "collectionURI":
              "http://gateway.marvel.com/v1/public/characters/1011334/series",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/1945",
              "name": "Avengers: The Initiative (2007 - 2010)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/2005",
              "name": "Deadpool (1997 - 2002)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/2045",
              "name": "Marvel Premiere (1972 - 1981)"
            }
          ],
          "returned": 3
        },
        "stories": {
          "available": 21,
          "collectionURI":
              "http://gateway.marvel.com/v1/public/characters/1011334/stories",
          "items": [
            {
              "resourceURI":
                  "http://gateway.marvel.com/v1/public/stories/19947",
              "name": "Cover #19947",
              "type": "cover"
            },
            {
              "resourceURI":
                  "http://gateway.marvel.com/v1/public/stories/19948",
              "name": "The 3-D Man!",
              "type": "interiorStory"
            },
            {
              "resourceURI":
                  "http://gateway.marvel.com/v1/public/stories/19949",
              "name": "Cover #19949",
              "type": "cover"
            },
            {
              "resourceURI":
                  "http://gateway.marvel.com/v1/public/stories/19950",
              "name": "The Devil's Music!",
              "type": "interiorStory"
            },
            {
              "resourceURI":
                  "http://gateway.marvel.com/v1/public/stories/19951",
              "name": "Cover #19951",
              "type": "cover"
            },
            {
              "resourceURI":
                  "http://gateway.marvel.com/v1/public/stories/19952",
              "name": "Code-Name:  The Cold Warrior!",
              "type": "interiorStory"
            },
            {
              "resourceURI":
                  "http://gateway.marvel.com/v1/public/stories/47184",
              "name": "AVENGERS: THE INITIATIVE (2007) #14",
              "type": "cover"
            },
            {
              "resourceURI":
                  "http://gateway.marvel.com/v1/public/stories/47185",
              "name": "Avengers: The Initiative (2007) #14 - Int",
              "type": "interiorStory"
            },
            {
              "resourceURI":
                  "http://gateway.marvel.com/v1/public/stories/47498",
              "name": "AVENGERS: THE INITIATIVE (2007) #15",
              "type": "cover"
            },
            {
              "resourceURI":
                  "http://gateway.marvel.com/v1/public/stories/47499",
              "name": "Avengers: The Initiative (2007) #15 - Int",
              "type": "interiorStory"
            },
            {
              "resourceURI":
                  "http://gateway.marvel.com/v1/public/stories/47792",
              "name": "AVENGERS: THE INITIATIVE (2007) #16",
              "type": "cover"
            },
            {
              "resourceURI":
                  "http://gateway.marvel.com/v1/public/stories/47793",
              "name": "Avengers: The Initiative (2007) #16 - Int",
              "type": "interiorStory"
            },
            {
              "resourceURI":
                  "http://gateway.marvel.com/v1/public/stories/48361",
              "name": "AVENGERS: THE INITIATIVE (2007) #17",
              "type": "cover"
            },
            {
              "resourceURI":
                  "http://gateway.marvel.com/v1/public/stories/48362",
              "name": "Avengers: The Initiative (2007) #17 - Int",
              "type": "interiorStory"
            },
            {
              "resourceURI":
                  "http://gateway.marvel.com/v1/public/stories/49103",
              "name": "AVENGERS: THE INITIATIVE (2007) #18",
              "type": "cover"
            },
            {
              "resourceURI":
                  "http://gateway.marvel.com/v1/public/stories/49104",
              "name": "Avengers: The Initiative (2007) #18 - Int",
              "type": "interiorStory"
            },
            {
              "resourceURI":
                  "http://gateway.marvel.com/v1/public/stories/49106",
              "name":
                  "Avengers: The Initiative (2007) #18, Zombie Variant - Int",
              "type": "interiorStory"
            },
            {
              "resourceURI":
                  "http://gateway.marvel.com/v1/public/stories/49888",
              "name": "AVENGERS: THE INITIATIVE (2007) #19",
              "type": "cover"
            },
            {
              "resourceURI":
                  "http://gateway.marvel.com/v1/public/stories/49889",
              "name": "Avengers: The Initiative (2007) #19 - Int",
              "type": "interiorStory"
            },
            {
              "resourceURI":
                  "http://gateway.marvel.com/v1/public/stories/54371",
              "name":
                  "Avengers: The Initiative (2007) #14, Spotlight Variant - Int",
              "type": "interiorStory"
            }
          ],
          "returned": 20
        },
        "events": {
          "available": 1,
          "collectionURI":
              "http://gateway.marvel.com/v1/public/characters/1011334/events",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/events/269",
              "name": "Secret Invasion"
            }
          ],
          "returned": 1
        },
        "urls": [
          {
            "type": "detail",
            "url":
                "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=6a9451a902cf5312d49d9b2b6426009d"
          },
          {
            "type": "wiki",
            "url":
                "http://marvel.com/universe/3-D_Man_(Chandler)?utm_campaign=apiRef&utm_source=6a9451a902cf5312d49d9b2b6426009d"
          },
          {
            "type": "comiclink",
            "url":
                "http://marvel.com/comics/characters/1011334/3-d_man?utm_campaign=apiRef&utm_source=6a9451a902cf5312d49d9b2b6426009d"
          }
        ]
      }
    ]
  }
};

void main() {
  group("MarvelsRepository", () {
    MarvelsApiRepository repo;
    INetworkService service;

    setUp(() {
      service = MockService();
      repo = MarvelsApiRepository(service);
    });

    tearDown(() {
      clearInteractions(service);
      reset(service);
      service = null;
      repo = null;
    });

    serviceGet(String url, response) =>
        when(service.get(url)).thenAnswer((realInvocation) async => response);

    serviceGetError(String url, Exception error) =>
        when(service.get(url)).thenThrow(error);

    group("Characters method", () {
      test(
          "getAllCharacters() returns ApiResponse with error status when error occurs",
          () {
        final expected =
            ApiResponse<List<MarvelCharacter>>.error("Failed to Load Data");

        serviceGetError(
            "/v1/public/characters", FailedException("Failed to Load Data"));

        repo.getAllCharacters().then((value) => expect(value, expected));
      });

      test(
          "getAllCharacters() returns ApiResponse with Success status when success",
          () {
        final Status expected = Status.success;
        serviceGet("/v1/public/characters", fakeCharactersResponse);
        repo.getAllCharacters().then((value) => expect(value.status, expected));
      });

      test(
          "getAllCharacters() returns ApiResponse with List<MarvelCharacter> when success",
          () {
        final List<MarvelCharacter> expected = [
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
        ];

        serviceGet("/v1/public/characters", fakeCharactersResponse);

        repo.getAllCharacters().then((value) => expect(value.data, expected));
      });
    });
  });
}