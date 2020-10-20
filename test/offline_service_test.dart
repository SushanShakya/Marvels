import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:marvels_app/services/custom_exceptions/failed_exception.dart';
import 'package:marvels_app/services/offline/file_offline_service.dart';
import 'package:mockito/mockito.dart';

class MockFile extends Mock implements File {}

void main() {
  group("FileOfflineService", () {
    FileOfflineService service;
    MockFile file;

    setUp(() {
      service = FileOfflineService();
      file = MockFile();
    });

    tearDown(() {
      clearInteractions(file);
      reset(file);
      file = null;
      service = null;
    });

    final exception = FailedException("Failed to Read");

    test("throws FailedException if nothing is saved in File", () {
      final expected = "Failed to Read";
      when(file.readAsString()).thenThrow(exception);
      service.read().catchError((e) => expect(e.toString(), expected));
    });

    test("return Json String when something is saved in File", () {
      final expected = jsonEncode({
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
      });
      when(file.readAsString()).thenAnswer((realInvocation) async => expected);
      service.read().then((value) => expect(value, expected));
    });
  });
}
