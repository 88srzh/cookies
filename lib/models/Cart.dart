// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final int price;
  final String images;

  CartItem({this.id, this.title, this.quantity, this.price, this.images});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _allSweets = {};

  Map<String, CartItem> get allSweets {
    return {..._allSweets};
  }

  int get sweetCount {
    return _allSweets.length;
  }

  void addItem(String sweetid, String title, int price) {
    if (_allSweets.containsKey(sweetid)) {
      _allSweets.update(
          sweetid,
          (existingCartItem) => CartItem(
                id: DateTime.now().toString(),
                title: existingCartItem.title,
                quantity: existingCartItem.quantity + 1,
                price: existingCartItem.price,
              ));
    } else {
      _allSweets.putIfAbsent(
          sweetid,
          () => CartItem(
                title: title,
                id: DateTime.now().toString(),
                quantity: 1,
                price: price,
              ));
    }
    notifyListeners();
  }

  void removeSweet(String id) {
    _allSweets.remove(id);
    notifyListeners();
  }

  void removeSingleSweet(String id) {
    if (!_allSweets.containsKey(id)) {
      return;
    }
    if (_allSweets[id].quantity > 1) {
      _allSweets.update(
          id,
          (existingCartItem) => CartItem(
                id: DateTime.now().toString(),
                title: existingCartItem.title,
                quantity: existingCartItem.quantity - 1,
                price: existingCartItem.price,
              ));
    }
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _allSweets.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  int get totalQuantity {
    var allQuantity = 0;
    _allSweets.forEach((key, cartItem) {
      allQuantity += cartItem.quantity;
    });
    return allQuantity;
  }

  void clear() {
    _allSweets = {};
    notifyListeners();
  }
}
