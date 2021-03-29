import 'package:flutter/material.dart';

class FavoriteItem {
  final String id;
  final String title;
  final String images;
  final int totalFavoriteCount;

  FavoriteItem({this.id, this.title, this.images, this.totalFavoriteCount});
}

class Favorite with ChangeNotifier {
  Map<String, FavoriteItem> _allFavorites = {};

  Map<String, FavoriteItem> get allFavorites {
    return {..._allFavorites};
  }

  void addFavoriteCount(
      String sweetid, String title, int totalFavoriteCount, String images) {
    if (_allFavorites.containsKey(sweetid)) {
      _allFavorites.update(
          sweetid,
          (existingFavoriteItem) => FavoriteItem(
                id: DateTime.now().toString(),
                title: existingFavoriteItem.title,
                totalFavoriteCount: existingFavoriteItem.totalFavoriteCount,
                images: existingFavoriteItem.images,
              ));
    } else {
      _allFavorites.putIfAbsent(
          sweetid,
          () => FavoriteItem(
              title: title,
              id: DateTime.now().toString(),
              totalFavoriteCount: 1,
              images: images));
    }

    notifyListeners();
  }

  void removeSingleFavoriteCount(String id) {
    if (!_allFavorites.containsKey(id)) {
      return;
    }
    if (_allFavorites[id].totalFavoriteCount > 0) {
      _allFavorites.update(
          id,
          (existingFavoriteItem) => FavoriteItem(
                id: DateTime.now().toString(),
                title: existingFavoriteItem.title,
                totalFavoriteCount: existingFavoriteItem.totalFavoriteCount - 1,
                images: existingFavoriteItem.images,
              ));
    }
    notifyListeners();
  }

  void clearFavorite() {
    _allFavorites = {};
    notifyListeners();
  }
}
