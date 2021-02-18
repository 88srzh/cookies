// import 'package:cookie/components/default_button.dart';
// import 'package:cookie/models/Cart.dart';
// import 'package:cookie/models/orders.dart';
// // import 'package:cookie/models/Cart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
// // import 'package:provider/provider.dart';

// import '../../../constants.dart';
// import '../../../size_config.dart';

// class CheckOurCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<Cart>(context);
//     return Container(
//       padding: EdgeInsets.symmetric(
//         vertical: getProportionateScreenWidth(15),
//         horizontal: getProportionateScreenWidth(30),
//       ),
//       // height: 174,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(0, -15),
//             blurRadius: 20,
//             color: Color(0xFFDADADA).withOpacity(0.15),
//           ),
//         ],
//       ),
//       child: SafeArea(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   height: getProportionateScreenWidth(40),
//                   width: getProportionateScreenWidth(40),
//                   decoration: BoxDecoration(
//                     color: Color(0xFFF5F6F9),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: SvgPicture.asset('assets/icons/receipt.svg'),
//                 ),
//                 Spacer(),
//                 Text('Введите купон'),
//                 const SizedBox(width: 10),
//                 Icon(
//                   Icons.arrow_forward_ios,
//                   size: 12,
//                   color: kTextColor,
//                 ),
//               ],
//             ),
//             SizedBox(height: getProportionateScreenHeight(20)),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text.rich(
//                   TextSpan(
//                     text: 'Итого:\n',
//                     children: [
//                       TextSpan(
//                         // text: '${cart.totalPrice}',
//                         text: '123',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 CheckoutButton(cart: cart),
//                 // SizedBox(
//                 //   width: getProportionateScreenWidth(190),
//                 //   child: CheckoutButton(cart: cart),
//                 //   // child: DefaultButton(
//                 //   //   text: 'Проверить',
//                 //   //   press: () {},
//                 //   // ),
//                 // ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CheckoutButton extends StatefulWidget {
//   final Cart cart;

//   const CheckoutButton({@required this.cart});

//   @override
//   _CheckoutButtonState createState() => _CheckoutButtonState();
// }

// class _CheckoutButtonState extends State<CheckoutButton> {
//   @override
//   Widget build(BuildContext context) {
//     return FlatButton(
//       child: Text('Проверить'),
//       onPressed: widget.cart.totalAmount <= 0
//           ? null
//           : () async {
//               await Provider.of<Orders>(context, listen: false).addOrder(
//                   widget.cart.allSweets.values.toList(),
//                   widget.cart.totalAmount);
//             },
//     );
//   }
// }
