import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class SplashContentNew extends StatelessWidget {
  final String headingText, middleText, bottomText;

  const SplashContentNew({this.headingText, this.middleText, this.bottomText});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Text(headingText,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26)),
            SizedBox(height: getProportionateScreenWidth(15)),
            Text(middleText, style: TextStyle(color: Colors.white, fontSize: 18)),
            Text(bottomText, style: TextStyle(color: Colors.white, fontSize: 18)),
          ],
        ),
    );
  }
}
