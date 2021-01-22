import 'package:cookie/screens/sign_in/sign_in_screen_new.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);

  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: getProportionateScreenWidth(200),
        height: getProportionateScreenWidth(50),
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
        )),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          border: Border.all(color: Colors.black87),
        ),
      ),
    );
  }
}
