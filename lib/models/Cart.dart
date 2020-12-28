import 'dart:collection';

import 'package:cookie/models/sweets.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  final Sweets sweets;
  final int numOfItems;

  Cart({@required this.sweets, @required this.numOfItems});
}

List<Cart> carts = [
  Cart(sweets: allSweets[0], numOfItems: 2),
  Cart(sweets: allSweets[1], numOfItems: 2),
  Cart(sweets: allSweets[2], numOfItems: 1),
  Cart(sweets: allSweets[2], numOfItems: 1),
  Cart(sweets: allSweets[2], numOfItems: 1),
  Cart(sweets: allSweets[2], numOfItems: 1),
  Cart(sweets: allSweets[2], numOfItems: 1),
  Cart(sweets: allSweets[2], numOfItems: 1),
];

// UnmodifiableListView<Cart> get carts_item => UnmodifiableListView(carts);

// int get totalPrice => carts.length * 42;

// void add(Cart cart) {
//   carts.add(cart);
//   // notifyListeners();
// }

// void removeAll() {
//   carts.clear();
// notifyListeners();
