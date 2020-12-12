import 'package:cookie/screens/otp/components/otp_form.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class BodyOtp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text('OTP Верификация', style: headingStyle),
              Text('Мы отправили Вам код на +7 912 123 ***'),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  // отправить код заново
                },
                child: Text(
                  'Отправить заново OTP код',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Код будет отправлен в течении '),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: Duration(seconds: 30), //allow user 30s
          builder: (context, value, child) => Text(
            '00:${value.toInt()}',
            style: TextStyle(
              color: kPrimaryColor,
            ),
          ),
          onEnd: () {},
        ),
      ],
    );
  }
}
