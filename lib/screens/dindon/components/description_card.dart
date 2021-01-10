import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
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
                  '  Классическое лакомство. Это изделия в форме\n кольца, изготовленные из сладкого теста и\n хорошо поджаренные на высококачественном\n растительном масле.'),
            )
          ],
        ),
      ],
    );
  }
}
