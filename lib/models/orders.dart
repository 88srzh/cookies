import 'package:cookie/models/Cart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderSweet {
  final String id;
  final int amount;
  final List<CartItem> sweets;
  final DateTime dateTime;

  OrderSweet({this.id, this.amount, this.sweets, this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderSweet> _orders = [];

  List<OrderSweet> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> cartSweets, int total) async {
    final url = 'https://food-83d92-default-rtdb.firebaseio.com/orders';
    final timeStamp = DateTime.now();
    try {
      final response = await http.post(url, body: json.encode({
        'id': DateTime.now().toString(),
        'amount': total,
        'dateTime': timeStamp.toIso8601String(),
        'sweets': cartSweets.map((cs) => {
          'id': cs.id,
          'title': cs.title,
          'quantity': cs.quantity,
          'price': cs.price,
        },).toList(),
      }));
      _orders.insert(0, OrderSweet(
        id: json.decode(response.body)['title'],
        amount: total,
        dateTime: timeStamp,
        sweets: cartSweets,
      ));
      notifyListeners();
    }
  }
}


