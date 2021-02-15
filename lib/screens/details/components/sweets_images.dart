// import 'package:cookie/models/sweets.dart';
// import 'package:flutter/material.dart';

// import '../../../constants.dart';
// import '../../../size_config.dart';

// class SweetsImages extends StatefulWidget {
//   const SweetsImages({
//     Key key,
//     @required this.allSweets,
//   }) : super(key: key);

//   final Sweets allSweets;

//   @override
//   _SweetsImagesState createState() => _SweetsImagesState();
// }

// class _SweetsImagesState extends State<SweetsImages> {
//   int selectedImage = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           width: getProportionateScreenWidth(238),
//           child: AspectRatio(
//             aspectRatio: 1,
//             child: Image.asset(widget.allSweets.images[selectedImage]),
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ...List.generate(
//               widget.allSweets.images.length,
//               (index) => buildSmallPreview(index),
//             )
//           ],
//         ),
//       ],
//     );
//   }

//   GestureDetector buildSmallPreview(int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedImage = index;
//         });
//       },
//       child: Container(
//         margin: EdgeInsets.only(right: getProportionateScreenWidth(15)),
//         padding: EdgeInsets.all(getProportionateScreenWidth(8)),
//         height: getProportionateScreenWidth(48),
//         width: getProportionateScreenWidth(48),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//               color:
//                   selectedImage == index ? kPrimaryColor : Colors.transparent),
//         ),
//         child: Image.asset(widget.allSweets.images[index]),
//       ),
//     );
//   }
// }
