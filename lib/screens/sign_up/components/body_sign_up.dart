import 'package:cookie/constants.dart';
import 'package:cookie/screens/sign_up/components/sign_up_form.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

import '../../../components/social_card.dart';
import '../../../size_config.dart';

class BodySignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // stops: [0.3, 1.8],
          colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]],
        ),
      ),
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
              Text(
                'Для продолжения примите наше \nПользовательское соглашение',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
            ],
          ),
        ),
      ),
    );
  }
}
