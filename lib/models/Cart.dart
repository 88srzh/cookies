import 'dart:collection';

import 'package:cookie/models/sweets.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  final Sweets sweets;
  final CatalogModel catalog;
  final int numOfItems;

  Cart({this.catalog, this.sweets, this.numOfItems});

  // UnmodifiableListView<Cart> get carts_item => UnmodifiableListView(carts);

  final List<int> _itemIds = [];

  // CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    assert(_itemIds.every((id) => newCatalog.getById(id) != null),
        'Каталог $newCatalog не содержит $_itemIds');
    catalog = newCatalog;
  }

  List<Sweets> get cartsItem =>
      _itemIds.map((id) => catalog.getById(id)).toList();

  // int get totalPrice => carts.length * 42;

  void add(Sweets sweet) {
    _itemIds.add(sweet.id);
    notifyListeners();
  }

  void remove(Sweets sweet) {
    _itemIds.remove(sweet.id);
    notifyListeners();
  }

  // void removeAll() {
  //   carts.clear();
  //   notifyListeners();
  // }
}

// List<Cart> carts = [
//   // Cart(sweets: allSweets[0], numOfItems: 2),
//   // Cart(sweets: allSweets[1], numOfItems: 2),
//   // Cart(sweets: allSweets[2], numOfItems: 1),
// ];
