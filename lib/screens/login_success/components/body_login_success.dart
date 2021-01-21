import 'package:cookie/components/continue_button.dart';
import 'package:cookie/components/default_button.dart';
import 'package:cookie/screens/dindon/dindon_main.dart';
import 'package:cookie/screens/home/home_screen.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class BodyLoginSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: FractionalOffset.bottomRight,
          // stops: [0.3, 1.5],
          colors: [
            Color.fromRGBO(248, 219, 221, 1.0),
            Colors.orange[100],
          ],
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          Image.asset(
            'assets/images/success.png',
            height: SizeConfig.screenHeight * 0.4,
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.08,
          ),
          Text(
            'Успешно',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.45,
            child: ContinueButton(
              text: 'На главную',
              // press: () => Navigator.pushNamed(context, HomeScreen.routeName),
              press: () =>
                  Navigator.pushNamed(context, DindonMainScreen.routeName),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
