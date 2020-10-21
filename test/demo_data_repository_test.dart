import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvels_app/models/marvel_character.dart';
import 'package:marvels_app/repository/demo_data_repository.dart';
import 'package:mockito/mockito.dart';

class MockData extends Mock implements AssetBundle {}

void main() {
  group("DemoDataRepository", () {
    DemoDataRepository repo;
    MockData data;

    setUp(() {
      repo = DemoDataRepository();
      data = MockData();
    });

    tearDown(() {
      clearInteractions(data);
      reset(data);
      repo = null;
      data = null;
    });

    group("getAllCharacters() return List<MarvelCharacter> from json", () {
      final fakeData = [
        {
          "id": 1009220,
          "name": "Captain America",
          "description":
              "Vowing to serve his country any way he could, young Steve Rogers took the super soldier serum to become America's one-man army. Fighting for the red, white and blue for over 60 years, Captain America is the living, breathing symbol of freedom and liberty.",
          "modified": "2020-04-04T19:01:59-0400",
          "thumbnail": {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/3/50/537ba56d31087",
            "extension": "jpg"
          },
          "urls": [
            {
              "type": "detail",
              "url":
                  "http://marvel.com/comics/characters/1009220/captain_america?utm_campaign=apiRef&utm_source=6a9451a902cf5312d49d9b2b6426009d"
            },
            {
              "type": "wiki",
              "url":
                  "http://marvel.com/universe/Captain_America_(Steve_Rogers)?utm_campaign=apiRef&utm_source=6a9451a902cf5312d49d9b2b6426009d"
            },
            {
              "type": "comiclink",
              "url":
                  "http://marvel.com/comics/characters/1009220/captain_america?utm_campaign=apiRef&utm_source=6a9451a902cf5312d49d9b2b6426009d"
            }
          ]
        },
      ];

      final expected = [MarvelCharacter.fromMap(fakeData[0])];

      when(data.loadString("demo_data/demo_data.json"))
          .thenAnswer((realInvocation) async => jsonEncode(fakeData));

      repo.getAllCharacters().then((value) => expect(value, expected));
    });
  });
}
