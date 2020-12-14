import 'package:cookie/screens/complete_profile/%D1%81omplete_profile_form.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_config.dart';

class BodyCompleteProfile extends StatelessWidget {
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
                'Завершите профиль',
                style: headingStyle,
              ),
              Text(
                'Завершите заполнение или \nвойдите через социальные сети',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              CompleteProfileForm(),
              SizedBox(height: getProportionateScreenHeight(30)),
              Text(
                'Для продолжения примите \nПользовательское соглашение',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
