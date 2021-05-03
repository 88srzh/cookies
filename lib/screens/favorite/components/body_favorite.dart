// // import 'package:cookie/models/cart.dart';
// import 'package:cookie/models/favorite.dart';
// import 'package:cookie/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cookie/screens/favorite/components/favorite_card.dart';

// class BodyFavorite extends StatefulWidget {
//   @override
//   _BodyFavoriteState createState() => _BodyFavoriteState();
// }

// class _BodyFavoriteState extends State<BodyFavorite> {
//   @override
//   Widget build(BuildContext context) {
//     // final cart = Provider.of<Cart>(context);
//     final favorite = Provider.of<Favorite>(context);
//     return Stack(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   Color.fromRGBO(248, 219, 221, 1.0),
//                   Colors.orange[100]
//                 ]),
//           ),
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: getProportionateScreenWidth(20),
//                 vertical: getProportionateScreenWidth(20)),
//             child: ListView.builder(
//               scrollDirection: Axis.vertical,
//               itemCount: favorite.allFavorites.length,
//               itemBuilder: (context, index) => Padding(
//                 padding: EdgeInsets.only(top: getProportionateScreenWidth(10)),
//                 child: FavoriteCard(
//                   favorite.allFavorites.values.toList()[index].id,
//                   favorite.allFavorites.keys.toList()[index],
//                   favorite.allFavorites.values
//                       .toList()[index]
//                       .totalFavoriteCount,
//                   favorite.allFavorites.values.toList()[index].title,
//                   favorite.allFavorites.values.toList()[index].images,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
