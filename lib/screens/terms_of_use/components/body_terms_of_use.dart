import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class BodyTermsOfUse extends StatelessWidget {
  const BodyTermsOfUse({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]]),
      ),
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      // width: double.infinity,
      child: Column(
        children: [
          Text(
            '2.1. Настоящие Правила представляют собой соглашение между Разработчиком и Пользователем (далее вместе именуемые «Стороны») и регулируют права и обязанности Разработчика и Пользователя в связи с использованием Приложения.',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
