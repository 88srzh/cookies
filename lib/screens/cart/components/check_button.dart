import 'package:cookie/models/cart.dart';
import 'package:cookie/models/errors/7_error_2.dart';
import 'package:cookie/models/orders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
