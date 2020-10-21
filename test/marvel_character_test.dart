import 'dart:convert';

import 'package:marvels_app/models/marvel_character.dart';
import 'package:test/test.dart';

void main() {
  test("Characters with same attributes are same !", () {
    MarvelCharacter character = MarvelCharacter(
      id: 20,
      name: "Captain America",
      image: "From internet",
      description: "",
    );

    MarvelCharacter character1 = MarvelCharacter(
      id: 20,
      name: "Captain America",
      image: "From internet",
      description: "",
    );

    expect(true, character == character1);
  });
  test("Characters with different attributes are different !", () {
    MarvelCharacter character = MarvelCharacter(
      id: 20,
      name: "Captain",
      image: "From internet",
      description: "",
    );

    MarvelCharacter character1 = MarvelCharacter(
      id: 20,
      name: "Captain America",
      image: "From internet",
      description: "",
    );

    expect(false, character == character1);
  });

  test("Characters can be created From Json Thrown by Api", () {
    final map = {
      "id": 1011334,
      "name": "3-D Man",
      "description": "",
      "modified": "2014-04-29T14:18:17-0400",
      "thumbnail": {
        "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
        "extension": "jpg"
      },
      "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011334",
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
    };
    MarvelCharacter character = MarvelCharacter.fromMap(map);

    MarvelCharacter character1 = MarvelCharacter(
        id: 1011334,
        name: "3-D Man",
        description: "",
        image: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784/landscape_large.jpg",
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
        ]);

    expect(character, character1);
  });

  test("List of marvel characters with same length are equal", () {
    List<MarvelCharacter> characters = [
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

    expect(characters, [
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
  });
  test("List of marvel characters with different length are different", () {
    List<MarvelCharacter> characters = [
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
          ]),
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

    expect(
        characters !=
            [
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
            ],
        true);
  });

  test("Marvel Characters can be created from file Json", () {
    MarvelCharacter character = MarvelCharacter.fromFile(jsonEncode({
      "id": 1011334,
      "name": "3-D Man",
      "description": "",
      "image": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg",
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
    }));
    MarvelCharacter character1 = MarvelCharacter(
        id: 1011334,
        name: "3-D Man",
        description: "",
        image: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg",
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
        ]);

    expect(character, character1);
  });

  test("Marvel characters can be converted to Json", () {
    final expected = jsonEncode({
      "id": 1011334,
      "name": "3-D Man",
      "description": "",
      "image": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg",
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
    });

    MarvelCharacter character1 = MarvelCharacter(
        id: 1011334,
        name: "3-D Man",
        description: "",
        image: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg",
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
        ]);

    expect(character1.toJson(), expected);
  });
}
