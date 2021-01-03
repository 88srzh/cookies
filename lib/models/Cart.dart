import 'package:cookie/models/sweets.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  final Sweets sweet;
  CatalogModel _catalog;
  // final int numOfItems;

  // UnmodifiableListView<Cart> get carts_item => UnmodifiableListView(carts);

  final List<int> _itemIds = [];

  Cart({this.sweet});

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

  // int get totalPrice =>
  //     cartsItem.fold(0, (total, current) => total + current.price);

  void add(Sweets sweet) async {
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
