import 'package:flutter/cupertino.dart';
import 'package:gifs_search/gifs_api.dart';

class GifsController {
  static final GifsController _singleton = GifsController._internal();

  factory GifsController() {
    return _singleton;
  }

  GifsController._internal();

  TextEditingController searchTextController = TextEditingController();

  int searchOffset = 0;

  ValueNotifier<bool> showGifs = ValueNotifier(false);

  int gifsGridItemCount(List data) {
    if (searchTextController.text.isEmpty) {
      return data.length;
    } else {
      return data.length + 1;
    }
  }

  triggerShowGifs() {
    showGifs.value = !showGifs.value;
  }

  loadMoreGifs() {
    searchOffset += 25;
    triggerShowGifs();
  }

  Future<Map> gifsFuture() {
    if (searchTextController.text.isEmpty) {
      return GifsAPI.getTrendingGifs();
    } else {
      return GifsAPI.getSearchGifs(searchTextController.text, searchOffset);
    }
  }
}
