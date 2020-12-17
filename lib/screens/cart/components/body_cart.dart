import 'package:cookie/models/Cart.dart';
import 'package:cookie/screens/cart/components/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BodyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Dismissible(
          key: Key(carts[0].sweets.id.toString()),
          background: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Color(0xFFFFE6E6),
            ),
            child: Row(
              children: [
                Spacer(),
                SvgPicture.asset('assets/icons/Trash.svg'),
              ],
            ),
          ),
          child: CartItemCard(
            cart: carts[0],
          ),
        ),
      ],
    );
  }
}
