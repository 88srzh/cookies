// import 'package:cookie/enums.dart';
import 'package:cookie/screens/profile/components/body_profile.dart';
// import 'package:cookie/screens/profile/components/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Профиль',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),
      body: BodyProfile(),
      // bottomNavigationBar: CustomBottomNavBar(
      //   selectedMenu: MenuState.profile,
      // ),
    );
  }
}
