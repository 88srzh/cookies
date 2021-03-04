// // import 'package:cookie/screens/profile/components/avatar.dart';
// // import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:provider/provider.dart';

// class ProfilePicNew extends StatefulWidget {
//   static String routeName = '/profile-pic';

//   @override
//   _ProfilePicNewState createState() => _ProfilePicNewState();
// }

// class _ProfilePicNewState extends State<ProfilePicNew> {
//   // User user;

//   @override
//   Widget build(BuildContext context) {
//     // final firebaseUser = context.watch<User>();
//     UserModel _currentUser = locator.get<UserController>().currentUser;
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Theme.of(context).primaryColor,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20.0),
//                   bottomRight: Radius.circular(20.0),
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Avatar(
//                     avatarUrl: firebaseUser?.avatarUrl,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
