import 'package:cookie/models/Cart.dart';
import 'package:cookie/screens/cart/components/body_cart.dart';
import 'package:cookie/screens/cart/components/check_out_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static String routeName = '/cart';
  // Cart cart;

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: BodyCart(),
      bottomNavigationBar: CheckOurCard(),
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
          'вкусняшки',
          // '${carts.length} вкусняшки',
          // '${cart.}'
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    ));
  }
}
