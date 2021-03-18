import 'package:cookie/models/errors/7_error_2.dart';
import 'package:cookie/screens/cart/components/body_cart.dart';
import 'package:flutter/material.dart';
import 'package:cookie/size_config.dart';
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
            // ! - add total quantity
            Text(
              '${cart.totalQuantity} шт.',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
      body: BodyCart(),
      // bottomNavigationBar: CheckCart(),

      bottomNavigationBar: Container(
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
                          text: '${cart.totalAmount}₽',
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
                // padding: EdgeInsets.only(
                //   top: getProportionateScreenWidth(15),
                //   bottom: getProportionateScreenWidth(15),
                //   left: getProportionateScreenWidth(20),
                //   right: getProportionateScreenWidth(20),
                // ),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(40),
                ),
                child: CheckoutButton(
                  cart: cart,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // AppBar buildAppBar(BuildContext context) {
  //   return
  // }
}

class CheckoutButton extends StatefulWidget {
  final Cart cart;

  const CheckoutButton({@required this.cart});

  @override
  _CheckoutButtonState createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextButton(
        child: Text(
          'Проверить',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: widget.cart.totalAmount <= 0
            ? () {
                Navigator.pushNamed(context, Error2Screen.routeName);
              }
            : () async {
                await Provider.of<Orders>(context, listen: false).addOrder(
                    widget.cart.allSweets.values.toList(),
                    widget.cart.totalAmount);
                widget.cart.clear();
              },
      ),
    );
  }
}
