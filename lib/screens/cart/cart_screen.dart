import 'package:cookie/models/errors/7_error_2.dart';
import 'package:cookie/screens/cart/components/body_cart.dart';
import 'package:cookie/screens/cart/components/bottom_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cookie/models/cart.dart';
// import 'package:cookie/components/check_button.dart';
import 'package:cookie/models/orders.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';
  final Cart cart;

  const CartScreen({this.cart});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      // appBar: buildAppBar(context),
      appBar: AppBar(
        // ! - fix arrow?
        title: Column(
          children: [
            Text(
              'Корзина',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              '${cart.totalQuantity} шт.',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
      body: BodyCart(),
      // bottomNavigationBar: CheckCart(),
      bottomNavigationBar: BottomCart(bottomCart: cart),
    );
  }
}
