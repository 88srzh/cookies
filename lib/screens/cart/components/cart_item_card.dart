// import 'package:cookie/models/Cart.dart';
// import 'package:cookie/models/sweets.dart';
// import 'package:cookie/screens/details/components/sweets_images.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../constants.dart';
// import '../../../size_config.dart';

// class CartItemCard extends StatelessWidget {
//   final Sweets allSweets;
//   // final Sweets sweet;

//   const CartItemCard({
//     Key key,
//     this.allSweets,
//     // this.sweet,

//     // this.cart,
//     // this.allSweets,
//   }) : super(key: key);

//   // final Cart carts;

//   @override
//   Widget build(BuildContext context) {
//     // return Consumer<CatalogModel>(builder: (context, cart, child) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 88,
//           child: AspectRatio(
//             aspectRatio: 0.88,
//             child: Container(
//               padding: EdgeInsets.all(getProportionateScreenWidth(10)),
//               decoration: BoxDecoration(
//                 color: Color(0xFFF5F6F9),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               // child: Image.asset(cart.cartsItem[index].images[0]),
//               // child: Image.asset(cart.carts_item.toString()),
//               // child: Image.asset(allSweets.images[0]),
//               // child: SweetsImages(allSweets: allSweets),
//               // ! - пытаюсь из details Достать изображение в Cart
//             ),
//           ),
//         ),
//         SizedBox(width: getProportionateScreenWidth(20)),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               '123',
//               // allSweets.allSweets[2].title,
//               // cart.
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.black,
//               ),
//               maxLines: 2,
//             ),
//             const SizedBox(height: 10),
//             Text.rich(
//               TextSpan(
//                 // text: allSweets[1].title,
//                 // text: '${cart.sweets.price}p',
//                 // text: 'price',
//                 // text: '${allSweets[index].price}p',
//                 // text: '${cart.cartsItem[index].price}p',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                   color: kPrimaryColor,
//                 ),
//                 children: [
//                   TextSpan(
//                     // text: ' x${cart.numOfItems}',
//                     text: 'numOfItems',
//                     style: TextStyle(color: kTextColor),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//     // },
//     // )
//   }
// }
