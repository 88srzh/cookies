// import 'package:cookie/screens/cart/components/body_cart.dart';
// import 'package:cookie/screens/cart/components/bottom_cart.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cookie/models/cart.dart';

// class CartScreen extends StatelessWidget {
//   static String routeName = '/cart';
//   // final Cart cart;

//   // const CartScreen({this.cart});

//   @override
//   Widget build(BuildContext context) {
//     // final cart = Provider.of<Cart>(context);
//     return Scaffold(
//       // appBar: buildAppBar(context),
//       appBar: AppBar(
//         // ! - fix arrow?
//         title: Column(
//           children: [
//             Text(
//               'Корзина',
//               style: TextStyle(color: Colors.black),
//             ),
//             Text(
//               // '${cart.totalQuantity} шт.',
//               style: Theme.of(context).textTheme.caption,
//             ),
//           ],
//         ),
//       ),
//       body: BodyCart(),
//       // bottomNavigationBar: BottomCart(bottomCart: cart),
//     );
//   }
// }
