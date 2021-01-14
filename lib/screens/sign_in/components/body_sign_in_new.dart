import 'package:cookie/screens/sign_in/components/sign_in_form.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class BodySignInNew extends StatelessWidget {
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
                    'We missed you!',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.07),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
