// import 'package:cookie/models/sweets.dart';
// import 'package:cookie/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class DescriptionCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final sweetId = ModalRoute.of(context).settings.arguments as String;
//     final loadedSweet = Provider.of<Sweets>(context).findById(sweetId);
//     return Column(
//       children: [
//         Row(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(
//                 top: getProportionateScreenHeight(10),
//                 left: getProportionateScreenWidth(20),
//                 right: getProportionateScreenWidth(20),
//               ),
//               child: Text(
//                 'Описание',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Row(
//           children: [
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.only(
//                   top: getProportionateScreenWidth(5),
//                   left: getProportionateScreenWidth(20),
//                   right: getProportionateScreenWidth(20),
//                 ),
//                 child: Text(
//                   loadedSweet.description,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
