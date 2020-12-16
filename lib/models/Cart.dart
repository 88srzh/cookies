import 'package:cookie/models/sweets.dart';
import 'package:flutter/material.dart';

class Cart {
  final Sweets sweets;
  final int numOfItems;

  Cart({@required this.sweets, @required this.numOfItems});
}

List<Cart> carts = [
  Cart(sweets: allSweets[0], numOfItems: 2),
  Cart(sweets: allSweets[1], numOfItems: 2),
  Cart(sweets: allSweets[3], numOfItems: 1),
];
