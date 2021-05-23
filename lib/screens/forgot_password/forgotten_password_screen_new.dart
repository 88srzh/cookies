import 'dart:io';

import 'package:cookie/controller/user_controller.dart';
import 'package:cookie/locator.dart';
import 'package:cookie/models/user.dart';
import 'package:cookie/screens/profile/components/avatar.dart';
import 'package:cookie/screens/profile/components/manage_profile_info.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ForgottenPasswordScreen extends StatefulWidget {
  static String routeName = '/forgotten-password';

  @override
  _ForgottenPasswordScreenState createState() => _ForgottenPasswordScreenState();
}

class _ForgottenPasswordScreenState extends State<ForgottenPasswordScreen> {
  UserModel _currentUser = locator.get<UserController>().currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]]),
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(getProportionateScreenWidth(40)),
                child: Container(
                  // decoration: BoxDecoration(
                  //   color: Theme.of(context).primaryColor,
                  //   borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(20.0),
                  //     bottomRight: Radius.circular(20.0),
                  //   ),
                  // ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Avatar(
                       avatarUrl: _currentUser?.avatarUrl,
                onTap: () async {
                  PickedFile pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
                  var image = File(pickedImage.path);
                  await locator.get<UserController>().uploadProfilePicture(image);
                          setState(() {});
                        },
                      ),
                      RichText(
                        text: TextSpan(
                          // ! fix text style
                          // style: DefaultTextStyle.of(context).style,
                          children: [
                            // TextSpan(text: 'Привет ${_currentUser.displayName}\n', style: TextStyle(fontSize: 20, color: Colors.black87)),
                            TextSpan(text: 'забыли пароль?', style: TextStyle(fontSize: 18, color: Colors.black87)),
                          ],),),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ManageProfileInformationWidget(currentUser: _currentUser),
            )
          ],
        ),
      ),
    );
  }
}