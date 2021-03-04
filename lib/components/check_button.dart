// import 'package:cookie/models/cart.dart';
// import 'package:cookie/models/orders.dart';
// import 'package:cookie/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CheckoutButton extends StatefulWidget {
//   final Cart cart;

//   const CheckoutButton({Key key, this.cart}) : super(key: key);

//   @override
//   _CheckoutButtonState createState() => _CheckoutButtonState();
// }

// class _CheckoutButtonState extends State<CheckoutButton> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       // height: getProportionateScreenHeight(56),
//       child: FlatButton(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         child: Text(
//           'Проверить',
//           style: TextStyle(
//             fontSize: getProportionateScreenWidth(18),
//             color: Colors.black87,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         onPressed: widget.cart.totalAmount <= 0
//             ? null
//             : () async {
//                 await Provider.of<Orders>(context, listen: false).addOrder(
//                     widget.cart.allSweets.values.toList(),
//                     widget.cart.totalAmount);
//               },
//       ),
//     );
//   }
// }
