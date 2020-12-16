import 'package:cookie/models/Cart.dart';
import 'package:cookie/screens/cart/components/body_cart.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: BodyCart(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        // Стрелочку исправить?
        title: Column(
      children: [
        Text(
          'Корзина',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        Text(
          '${carts.length} вкусняшки',
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    ));
  }
}
