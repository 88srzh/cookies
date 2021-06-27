import 'package:cookie/screens/sign_up/components/sign_up_form.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreenNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  // image: AssetImage('assets/images/background-splash-screen-second.jpg'),
                  image: AssetImage('assets/images/background-sign-in-screen.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              child: Row(
                children: [
                  InkWell(
                    child: FaIcon(FontAwesomeIcons.arrowLeft, size: 20, color: Colors.white),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: getProportionateScreenWidth(40)),
                      Expanded(
                        flex: 2,
                          child: Text('123'),
                      ),
                      Expanded(
                        child: SignUpForm(),
                      ),
                    ],
                  ),
            ),

          ],
        ));
  }
}
