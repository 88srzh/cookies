import 'package:cookie/models/Cart.dart';
import 'package:cookie/models/sweets.dart';
import 'package:cookie/screens/dindon/components/body_dindon.dart';
import 'package:cookie/screens/dindon/components/body_dindon_main.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class BottomAddToCart extends StatefulWidget {
  const BottomAddToCart({
    Key key,
    this.widget,
    this.allSweets,
  }) : super(key: key);

  final BodyDindonScreen widget;
  final Sweets allSweets;

  @override
  _BottomAddToCartState createState() => _BottomAddToCartState();
}

class _BottomAddToCartState extends State<BottomAddToCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: getProportionateScreenWidth(100),
      margin: EdgeInsets.only(
        top: getProportionateScreenWidth(20),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(250, 237, 238, 1.0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: getProportionateScreenWidth(15),
          left: getProportionateScreenWidth(10),
          right: getProportionateScreenWidth(10),
          bottom: getProportionateScreenWidth(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\n${widget.widget.allSweets.price}₽\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Итого',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                top: getProportionateScreenWidth(15),
                bottom: getProportionateScreenWidth(15),
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20),
              ),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(40),
              ),
              child: InkWell(
                child: Text(
                  'Добавить в корзину',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                onTap: () {
                  cartToast();
                  var cart = context.read<Cart>();
                  cart.add();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void cartToast() {
    Fluttertoast.showToast(
      msg: 'Товар добавлен',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blueAccent,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
