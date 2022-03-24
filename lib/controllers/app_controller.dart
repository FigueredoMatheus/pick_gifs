import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gifs_search/controllers/local_store_controller.dart';
import 'package:gifs_search/controllers/gifs_api.dart';
import 'package:flutter_share/flutter_share.dart';

class AppController {
  static final AppController _singleton = AppController._internal();

  factory AppController() {
    return _singleton;
  }

  AppController._internal();

  LocalStoreController localStoreController = LocalStoreController();

  GifsAPIController gifsAPIController = GifsAPIController();

  TextEditingController searchTextController = TextEditingController();

  ValueNotifier<List> listFavoriteGifs = ValueNotifier([]);

  int searchOffset = 0;

  ValueNotifier<bool> showGifs = ValueNotifier(false);

  void saveGifAsFavorite(Map gif) {
    listFavoriteGifs.value.add(gif);
    localStoreController.saveGifAsFavorite(listFavoriteGifs.value);
  }

  Future<void> getFavoriteGifs() async {
    await localStoreController.getFavoriteGifs().then((favoriteGifs) {
      listFavoriteGifs.value = json.decode(favoriteGifs);
    });
  }

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
      return gifsAPIController.getTrendingGifs();
    } else {
      return gifsAPIController.getSearchGifs(
          searchTextController.text, searchOffset);
    }
  }

  Future<void> shareGifUrl(String gifUrl) async {
    await FlutterShare.share(title: 'Gif maravilhoso!', linkUrl: gifUrl);
  }
}
