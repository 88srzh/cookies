import 'package:cookie/models/cart.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:cookie/screens/cart/components/cart_item_card.dart';

class BodyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: cart.allSweets.length,
              itemBuilder: (context, index) => CartSweet(
                cart.allSweets.values.toList()[index].id,
                cart.allSweets.keys.toList()[index],
                cart.allSweets.values.toList()[index].price,
                cart.allSweets.values.toList()[index].quantity,
                cart.allSweets.values.toList()[index].title,
                cart.allSweets.values.toList()[index].images,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
