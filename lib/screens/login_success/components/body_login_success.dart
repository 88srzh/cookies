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
          end: Alignment.bottomRight,
          colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]],
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 0.35,
          ),
          Text(
            'Успешно',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          // Spacer(),
          SizedBox(
            height: SizeConfig.screenHeight * 0.3,
          ),
          OutlinedButton(
            child: Text('На главную'),
            onPressed: () => Navigator.pushNamed(context, HomeScreen.routeName),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
