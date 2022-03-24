import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LocalStoreController {
  Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();

    return File('${directory.path}/favorite_gifs.json');
  }

  saveGifAsFavorite(List favoriteGifs) async {
    String data = json.encode(favoriteGifs);
    final file = await _getLocalFile();

    file.writeAsString(data);
  }

  Future<String> getFavoriteGifs() async {
    try {
      final file = await _getLocalFile();
      if (file.existsSync()) {
        return file.readAsString();
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }
}
