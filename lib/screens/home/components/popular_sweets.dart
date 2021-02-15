// import 'package:cookie/components/sweets_card.dart';
// import 'package:cookie/models/sweets.dart';
// import 'package:cookie/screens/details/details_screen.dart';
// import 'package:cookie/screens/home/components/section_title.dart';
// import 'package:flutter/material.dart';

// import '../../../size_config.dart';

// class PopularSweets extends StatelessWidget {
//   const PopularSweets({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding:
//               EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
//           child: SectionTitle(
//             text: 'Популярное',
//             press: () {},
//           ),
//         ),
//         SizedBox(height: getProportionateScreenWidth(20)),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: [
//               ...List.generate(
//                 CatalogModel().allSweets.length,
//                 (index) {
//                   if (CatalogModel().allSweets[index].isPopular)
//                     return SweetsCard(
//                       sweets: CatalogModel().allSweets[index],
//                       press: () => Navigator.pushNamed(
//                         context,
//                         DetailsScreen.routeName,
//                         arguments: SweetsDetailsArguments(
//                           allSweets: CatalogModel().allSweets[index],
//                         ),
//                       ),
//                     );
//                   return SizedBox.shrink();
//                 },
//               ),
//               SizedBox(width: getProportionateScreenWidth(20)),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
