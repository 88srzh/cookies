import 'package:cookie/components/custom_surfix_icon.dart';
import 'package:cookie/components/default_button.dart';
import 'package:cookie/constants.dart';
import 'package:cookie/screens/sign_up/components/sign_up_form.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

import '../../../components/social_card.dart';
import '../../../size_config.dart';

class BodySignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(
                'Зарегистрироваться',
                style: headingStyle,
              ),
              Text(
                'Заполните анкету или продолжите \nчерез социальные сети',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.07),
              SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.07),
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
              SizedBox(height: getProportionateScreenHeight(20)),
              Text(
                'Для продолжения примите наше \nПользовательское соглашение',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
