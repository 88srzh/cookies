import 'package:cookie/screens/cart/cart_screen.dart';
import 'package:cookie/screens/dindon/components/dindon_screen.dart';
import 'package:cookie/screens/dindon/dindon_main.dart';
import 'package:cookie/screens/home/components/icon_btn_with_counter.dart';
import 'package:cookie/screens/home/components/search_field.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            svgSrc: 'assets/icons/Cart Icon.svg',
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          IconBtnWithCounter(
            svgSrc: 'assets/icons/Bell.svg',
            numOfItems: 3,
            press: () =>
                Navigator.pushNamed(context, DindonMainScreen.routeName),
          ),
        ],
      ),
    );
  }
}
