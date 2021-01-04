import 'package:cookie/models/sweets.dart';
import 'package:cookie/screens/details/components/color_dots.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  CatalogModel _catalog;
  // final int numOfItems;
  ColorDots counters;

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    assert(_itemIds.every((id) => newCatalog.getById(id) != null),
        'Каталог $newCatalog не содержит $_itemIds');
    _catalog = newCatalog;
    notifyListeners();
  }

  List<Sweets> get cartsItem =>
      _itemIds.map((id) => catalog.getById(id)).toList();

  double get totalPrice =>
      cartsItem.fold(0, (total, current) => total + current.price);

  void add(Sweets sweet) {
    _itemIds.add(sweet.id);
    notifyListeners();
  }

  void remove(Sweets sweet) {
    _itemIds.remove(sweet.id);
    notifyListeners();
  }

  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void decrementCounter() {
    counter--;
    notifyListeners();
  }
}

// void removeAll() {
//   carts.clear();
//   notifyListeners();
// }

// List<Cart> carts = [
//   // Cart(sweets: allSweets[0], numOfItems: 2),
//   // Cart(sweets: allSweets[1], numOfItems: 2),
//   // Cart(sweets: allSweets[2], numOfItems: 1),
// ];
