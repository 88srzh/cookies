import 'package:cookie/models/cart.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cookie/screens/cart/components/check_button.dart';

class BottomCart extends StatelessWidget {
  const BottomCart({
    @required this.bottomCart,
  });

  final Cart bottomCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: getProportionateScreenWidth(100),
      // margin: EdgeInsets.only(
      //   top: getProportionateScreenWidth(20),
      // ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(250, 237, 238, 1.0),
        borderRadius: BorderRadius.only(
            // topLeft: Radius.circular(40),
            // topRight: Radius.circular(40),
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
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Итого\n\n',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: '${bottomCart.totalAmount}₽',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
              child: CheckoutButton(
                cart: bottomCart,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
