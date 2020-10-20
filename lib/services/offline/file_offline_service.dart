import 'dart:io';

import 'package:marvels_app/services/custom_exceptions/failed_exception.dart';
import 'package:marvels_app/services/offline/offline_service.dart';
import 'package:path_provider/path_provider.dart';

class FileOfflineService implements IOfflineService {
  // Get path
  static Future<String> get _localPath async {
    Directory _directory = await getApplicationDocumentsDirectory();

    return _directory.path;
  }

  // Get reference to file
  static Future<File> get _file async {
    String _path = await _localPath;

    return File('$_path/marvel_characters.txt');
  }

  @override
  Future<String> read() async {
    try {
      File file = await _file;
      return await file.readAsString();
    } catch (e) {
      throw FailedException("Failed to Read");
    }
  }

  @override
  void write(String json) async {
    File file = await _file;
    await file.writeAsString(json);
  }
}
