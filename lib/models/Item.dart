import 'dart:collection';

import 'package:flutter/material.dart';

class Item extends ChangeNotifier {
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  int get totalItemsPrice => _items.length * 40;
}
