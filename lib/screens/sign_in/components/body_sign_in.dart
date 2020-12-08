import 'package:cookie/components/social_card.dart';
import 'package:cookie/constants.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

import 'sign_in_form.dart';

class BodySignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                Text(
                  'С возвращением',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Войдите с помощью почтового адреса и пароля \nили через социальные сети',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                ),
                SignForm(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: 'assets/icons/google-icon.svg',
                      press: () {},
                    ),
                    SocialCard(
                      icon: 'assets/icons/facebook-2.svg',
                      press: () {},
                    ),
                    SocialCard(
                      icon: 'assets/icons/twitter.svg',
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Нет аккаунта? ',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                      ),
                    ),
                    Text(
                      'Зарегистрироваться',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
