import 'package:cookie/models/Cart.dart';
import 'package:cookie/screens/cart/components/cart_item_card.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class BodyCart extends StatefulWidget {
  @override
  _BodyCartState createState() => _BodyCartState();
}

class _BodyCartState extends State<BodyCart> {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();
    // return Padding(
    //   padding:
    //       EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
    //   child:
    return ListView.builder(
      scrollDirection: Axis.vertical,
      // itemCount: cart.length,
      itemCount: cart.cartsItem.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Dismissible(
          // key: Key(carts[index].sweets.id.toString()),
          key: Key(cart.cartsItem[index].id.toString()),
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
              // carts.removeAt(index);
              cart.remove(cart.cartsItem[index]);
            });
          },
          child: CartItemCard(),
        ),
      ),
      // ),
    );
  }
}
