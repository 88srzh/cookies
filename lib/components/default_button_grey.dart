import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class DefaultButtonGrey extends StatelessWidget {
  const DefaultButtonGrey({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);

  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(20),
        horizontal: getProportionateScreenWidth(40),
      ),
      child: Container(
        width: getProportionateScreenWidth(130),
        height: getProportionateScreenHeight(50),
        decoration: BoxDecoration(
          // color: Color.fromRGBO(151, 145, 147, 0.2),
          color: Color.fromRGBO(241, 240, 244, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenWidth(15),
            horizontal: getProportionateScreenWidth(20),
          ),
          child: InkWell(
            onTap: press,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
