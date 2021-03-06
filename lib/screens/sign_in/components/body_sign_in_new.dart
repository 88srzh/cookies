// import 'package:cookie/screens/auth/authentification_service.dart';
// import 'package:cookie/screens/auth/google_sign_in.dart';
import 'package:cookie/screens/sign_in/components/sign_in_form.dart';
import 'package:cookie/size_config.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BodySignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // stops: [0.3, 1.8],
            colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
              ),
              child: Column(
                children: [
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
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
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
                          // context
                          //     .read<AuthentificationService>()
                          //     .signInAnonymously();
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.google,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          // final googleProvider =
                          //     Provider.of<GoogleSignInProvider>(context,
                          //         listen: false);
                          // googleProvider.login();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.05),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
