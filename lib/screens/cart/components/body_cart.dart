import 'package:cookie/models/Cart.dart';
import 'package:cookie/screens/cart/components/cart_item_card.dart';
import 'package:flutter/material.dart';

class BodyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartItemCard(
          cart: carts[0],
        ),
      ],
    );
  }
}
