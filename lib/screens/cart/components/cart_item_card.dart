import 'package:cookie/models/Cart.dart';
import 'package:cookie/models/sweets.dart';
import 'package:cookie/screens/details/components/sweets_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CartItemCard extends StatelessWidget {
  final Sweets allSweets;
  final Cart cart;

  const CartItemCard({
    Key key,
    @required this.cart,
    this.allSweets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Row(
          children: [
            SizedBox(
              width: getProportionateScreenWidth(88),
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(cart.sweets.images[0]),
                  // child: Image.asset(cart.carts_item.toString()),
                  // child: Image.asset(allSweets.images[0]),
                  // child: SweetsImages(allSweets: allSweets),
                  // ! - пытаюсь из details Достать изображение в Cart
                ),
              ),
            ),
            SizedBox(width: getProportionateScreenWidth(20)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.sweets.title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    // text: '${cart.sweets.price}p',
                    text: '${cart.sweets.price}p',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                    children: [
                      TextSpan(
                        text: ' x${cart.numOfItems}',
                        style: TextStyle(color: kTextColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
