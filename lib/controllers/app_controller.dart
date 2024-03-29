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

  int currentPageIndex = 0;

  AppController._internal();

  LocalStoreController localStoreController = LocalStoreController();

  GifsAPIController gifsAPIController = GifsAPIController();

  TextEditingController searchTextController = TextEditingController();

  List listFavoriteGifs = [];

  ValueNotifier<bool> notifierFavoritePage = ValueNotifier(false);

  int searchOffset = 0;

  ValueNotifier<bool> notifierGifsPage = ValueNotifier(false);

  void saveGifAsFavorite(Map gif) {
    if (listFavoriteHasGif(gif['id'])) {
      return;
    }

    listFavoriteGifs.add(gif);
    localStoreController.saveGifAsFavorite(listFavoriteGifs);
    triggerFavoritePage();
  }

  void removeGifAsFavorite(Map gif) {
    listFavoriteGifs.removeWhere((favGif) => favGif['id'] == gif['id']);
    localStoreController.saveGifAsFavorite(listFavoriteGifs);
    triggerFavoritePage();
  }

  Future<void> getFavoriteGifs() async {
    await localStoreController.getFavoriteGifs().then((favoriteGifs) {
      listFavoriteGifs = json.decode(favoriteGifs);
    });
  }

  int gifsGridItemCount(List data) {
    if (currentPageIndex == 1 || searchTextController.text.isEmpty) {
      return data.length;
    } else {
      return data.length + 1;
    }
  }

  triggerShowGifs() {
    notifierGifsPage.value = !notifierGifsPage.value;
  }

  triggerFavoritePage() {
    notifierFavoritePage.value = !notifierFavoritePage.value;
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

  bool listFavoriteHasGif(String gifId) {
    return listFavoriteGifs.any((gif) => gif['id'] == gifId);
  }
}
