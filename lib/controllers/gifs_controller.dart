import 'package:flutter/cupertino.dart';
import 'package:gifs_search/gifs_api.dart';

class GifsController {
  static final GifsController _singleton = GifsController._internal();

  factory GifsController() {
    return _singleton;
  }

  GifsController._internal();

  TextEditingController searchController = TextEditingController();

  int searchOffset = 0;

  ValueNotifier<bool> showGifs = ValueNotifier(false);

  triggerShowGifs() {
    showGifs.value = !showGifs.value;
  }

  Future<Map> gifsFuture() {
    if (searchController.text.isEmpty) {
      return GifsAPI.getTrendingGifs();
    } else {
      return GifsAPI.getSearchGifs(searchController.text, searchOffset);
    }
  }
}
