import 'package:flutter/material.dart';

class ItemsInfo extends ChangeNotifier {
  ItemsInfo(
      {this.title, this.categories, this.price, this.totalFavoriteCount});

  final String title;
  final String categories;
  final int price;
  final int totalFavoriteCount;

  static List<ItemsInfo> _itemsInfo = [
    ItemsInfo(
      title: 'Красный вельвет',
      categories: 'Данкины',
      price: 65,
      totalFavoriteCount: 0,
    ),
    ItemsInfo(
      title: 'Шоколадный',
      categories: 'Данкины',
      price: 75,
      totalFavoriteCount: 0,
    ),
  ];

  List<ItemsInfo> get itemsInfo {
    return [..._itemsInfo];
  }
}
