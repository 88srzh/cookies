// import 'package:cookie/models/sweets.dart';
// import 'package:cookie/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../constants.dart';
// // import '../size_config.dart';

// class SweetsCard extends StatefulWidget {
//   const SweetsCard({
//     Key key,
//     this.width = 140,
//     this.aspectRation = 1.02,
//     @required this.sweets,
//     @required this.press,
//   }) : super(key: key);

//   final double width, aspectRation;
//   final Sweets sweets;
//   final GestureTapCallback press;

//   @override
//   _SweetsCardState createState() => _SweetsCardState();
// }

// class _SweetsCardState extends State<SweetsCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 20),
//       child: GestureDetector(
//         onTap: widget.press,
//         child: SizedBox(
//           width: 150,
//           child: Column(
//             children: [
//               AspectRatio(
//                 aspectRatio: widget.aspectRation,
//                 child: Container(
//                   padding: EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: kSecondaryColor.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Image.asset(widget.sweets.images[0]),
//                 ),
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 widget.sweets.title,
//                 style: TextStyle(
//                   color: Colors.black,
//                 ),
//                 maxLines: 2,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: getProportionateScreenWidth(5)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       '${widget.sweets.price} p',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         color: kPrimaryColor,
//                       ),
//                     ),
//                     Icon(Icons.star, color: Colors.red[300]),
//                     InkWell(
//                       splashColor: Colors.transparent,
//                       borderRadius: BorderRadius.circular(30),
//                       onTap: () {
//                         // _tapFavourite();
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(8),
//                         width: 28,
//                         height: 28,
//                         decoration: BoxDecoration(
//                           color: widget.sweets.isFavourite
//                               ? kPrimaryColor.withOpacity(0.15)
//                               : kSecondaryColor.withOpacity(0.1),
//                           shape: BoxShape.circle,
//                         ),
//                         child: SvgPicture.asset('assets/icons/Heart Icon_2.svg',
//                             color: widget.sweets.isFavourite
//                                 ? Color(0xFFFF4848)
//                                 : Color(0xFFDBDEE4)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // void _tapFavourite() {
//   //   setState(() {
//   //     if (widget.sweets.isFavourite) {
//   //       widget.sweets.isFavourite = false;
//   //     } else {
//   //       widget.sweets.isFavourite = true;
//   //     }
//   //   });
//   // }
// }
