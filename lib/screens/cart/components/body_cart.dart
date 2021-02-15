import 'package:cookie/constants.dart';
import 'package:cookie/models/Cart.dart';
import 'package:cookie/models/cart_new.dart';
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
    // var cart = context.watch<Cart>();
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
              // itemCount: cart.cartsItem.length,
              itemCount: cart.allSweets.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  // key: Key(cart.cartsItem[index].id.toString()),
                  key: Key(cart.allSweets[index].id.toString()),
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

                      // cart.remove(cart.cartsItem[index]);
                    });
                  },
                  // ! - cart_item_card
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 88,
                        child: AspectRatio(
                          aspectRatio: 0.88,
                          child: Container(
                            padding:
                                EdgeInsets.all(getProportionateScreenWidth(10)),
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F6F9),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            // child: Image.asset(
                            //     // cart.catalog.allSweets[index].images),
                            //     ),
                            // ! - пытаюсь из details Достать изображение в Cart
                          ),
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(20)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // '${cart.catalog.allSweets[index].title}',
                            '${cart.allSweets[index].title}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            maxLines: 2,
                          ),
                          const SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                              // text: '${cart.catalog.allSweets[index].price}p',
                              text: '${cart.allSweets[index].price}p',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor,
                              ),
                              children: [
                                TextSpan(
                                  // text: ' x${widget.numOfItems.counter}',
                                  text: ' numOfItems',
                                  style: TextStyle(color: kTextColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // ),
            ),
          ),
        ),
      ],
    );
  }
}
