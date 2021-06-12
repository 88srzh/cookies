// import 'package:cookie/constants.dart';
// import 'package:cookie/screens/sign_in/sign_in_screen.dart';
// import 'package:cookie/size_config.dart';
// import '../components/splash_content.dart';
// import 'package:flutter/material.dart';
// // import 'package:im_stepper/main.dart';
// // import 'package:im_stepper/stepper.dart';
//
// class Body extends StatefulWidget {
//   @override
//   _BodyState createState() => _BodyState();
// }
//
// class _BodyState extends State<Body> {
//   // int activeStep = 0;
//   // int upperBoud = 3;
//   int _currentPage = 0;
//   List<Map<String, String>> splashData = [
//     {
//       'text': 'Добро пожаловать во Вкусняшечную!',
//       'image': 'assets/images/cup_of_sweets.png'
//     },
//     {
//       'text': 'У нас самые вкусные вкусняшки!',
//       'image': 'assets/images/cup_of_sweets3.png'
//     },
//     {
//       'text': 'Попробуйте и убедитесь в этом сами!',
//       'image': 'assets/images/cup_of_sweets7.png'
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             // begin: Alignment.center,
//             // end: Alignment.bottomCenter,
//             // stops: [0.3, 1],
//             // colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[200]],
//             colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]],
//           ),
//         ),
//         child: SizedBox(
//           width: double.infinity,
//           child: Column(
//             children: <Widget>[
//               // ImageStepper(
//               // images: [
//               //     AssetImage('assets/images/cup_of_sweets.png'),
//               //     AssetImage('assets/images/cup_of_sweets3.png'),
//               //     AssetImage('assets/images/cup_of_sweets7.png'),
//               //   ],
//               //   activeStep: activeStep,
//               //   onStepReached: (index) {
//               //     setState(() {
//               //       activeStep = index;
//               //     });
//               // },
//               // ),
//               // OutlinedButton(
//               //   onPressed: () {},
//               //   child: Text('Далее'),
//               //   ),
//
//               // ! first version
//               Expanded(
//                 flex: 1,
//                 child: PageView.builder(
//                   onPageChanged: (value) {
//                     setState(() {
//                       _currentPage = value;
//                     });
//                   },
//                   itemCount: splashData.length,
//                   itemBuilder: (context, index) => SplashContent(
//                     text: splashData[index]['text'],
//                     image: splashData[index]['image'],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: getProportionateScreenWidth(20),
//                       vertical: getProportionateScreenWidth(130)),
//                   child: Column(
//                     children: <Widget>[
//                       Spacer(),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: List.generate(
//                           splashData.length,
//                           (index) => buildDot(index: index),
//                         ),
//                       ),
//                       Spacer(flex: 1),
//                       OutlinedButton(
//                         // onPressed: () {
//                         //   setState(() {
//                             // _currentPage = value;
//                           // });
//                         // },
//                         onPressed: () => Navigator.pushNamed(
//                             context, SignInScreen.routeName),
//                         child: Text('Продолжить',
//                             style:
//                                 TextStyle(color: Colors.black87, fontSize: 22)),
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.transparent,
//                           side:
//                               BorderSide(width: getProportionateScreenWidth(2)),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(
//                                   getProportionateScreenWidth(20))),
//                         ),
//                       ),
//                       // Spacer(),
//                       SizedBox(
//                         height: getProportionateScreenWidth(20),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   AnimatedContainer buildDot({int index}) {
//     return AnimatedContainer(
//       duration: kAnimationDuration,
//       margin: EdgeInsets.only(right: 5.0),
//       height: 6,
//       width: _currentPage == index ? 20 : 6,
//       decoration: BoxDecoration(
//         color: _currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
//         borderRadius: BorderRadius.circular(3),
//       ),
//     );
//   }
// }
