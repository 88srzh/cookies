import 'package:cookie/screens/sign_in/components/sign_in_form.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BodySignInScreenNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
          children: [

            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  // image: AssetImage('assets/images/background-splash-screen-second.jpg'),
                  image: AssetImage('assets/images/background-signIn-screen.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.arrowLeft, size: 20, color: Colors.white),
                ],
              ),
            ),
            Center(
                child: Column(
                  children: [
                    SizedBox(height: getProportionateScreenWidth(40)),
                    Expanded(
                        child: Text('Войдите в аккаунт', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                            ),
                    SizedBox(height: getProportionateScreenWidth(15)),
                    Expanded(child: Text('Продолжите покупки', style: TextStyle(color: Colors.white, fontSize: 18))),
                    SignForm(),
                  ],

                ),
            ),

          ],

        ));
  }
}
