import 'package:cookie/screens/dindon/components/body_dindon.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final BodyDindonScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: getProportionateScreenHeight(10),
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20),
              ),
              child: Text(
                'Описание',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: getProportionateScreenWidth(5),
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20),
              ),
              child: Text(
                widget.allSweets.description,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
