// import 'package:cookie/screens/auth/authentification_service.dart';
// import 'package:cookie/screens/auth/authentification_service.dart';
// import 'package:cookie/screens/auth/google_sign_in.dart';
import 'package:cookie/screens/sign_in/components/sign_in_form.dart';
import 'package:cookie/screens/sign_up/sign_up_screen.dart';
import 'package:cookie/size_config.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';

class BodySignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // stops: [0.3, 1.8],
          colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]],
        ),
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.2),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Войти.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Мы скучали!',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.07),
                      SignForm(),
                      SizedBox(height: SizeConfig.screenHeight * 0.035),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(FontAwesomeIcons.userSecret,
                                color: Colors.grey),
                            onPressed: () {
                              // context.read<AuthentificationService>().signInAnonymously();
                            },
                          ),
                          IconButton(
                            icon: Icon(FontAwesomeIcons.google,
                                color: Colors.black87),
                            onPressed: () {
                              // final googleProvider = Provider.of<GoogleSignInProvider>(context, listen: false);
                              // googleProvider.login();
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Text(
                              'Зарегистрироваться',
                              style: TextStyle(
                                  fontSize: 16,
                                  decoration: TextDecoration.underline),
                            ),
                            onTap: () => Navigator.pushNamed(
                                context, SignUpScreen.routeName),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.035),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
