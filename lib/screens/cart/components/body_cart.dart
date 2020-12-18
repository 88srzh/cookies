import 'package:cookie/models/Cart.dart';
import 'package:cookie/screens/cart/components/cart_item_card.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BodyCart extends StatefulWidget {
  @override
  _BodyCartState createState() => _BodyCartState();
}

class _BodyCartState extends State<BodyCart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: carts.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(carts[0].sweets.id.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset('assets/icons/Trash.svg'),
                ],
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                carts.removeAt(index);
              });
            },
            child: CartItemCard(
              cart: carts[index],
            ),
          ),
        ),
      ),
    );
  }
}
