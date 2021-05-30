import 'package:cookie/screens/complete_profile/%D1%81omplete_profile_form.dart';
import 'package:cookie/screens/terms_of_use/terms_of_use_screen.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_config.dart';

class BodyCompleteProfile extends StatelessWidget {
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
                'Завершите регистрацию',
                style: headingStyle,
              ),
              Text(
                'Завершите заполнение или \nвойдите через социальные сети',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              CompleteProfileForm(),
              SizedBox(height: getProportionateScreenHeight(30)),
              InkWell(
                child: Text(
                  'Для продолжения примите \nПользовательское соглашение',
                  textAlign: TextAlign.center,
                ),
                onTap: () =>
                    Navigator.pushNamed(context, TermsOfUseScreen.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
