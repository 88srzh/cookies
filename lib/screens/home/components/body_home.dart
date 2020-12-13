import 'package:cookie/screens/home/components/discount_banner.dart';
import 'package:cookie/screens/home/components/home_header.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

import '../../../bottom_bar.dart';
import '../../../cookie_page.dart';
import '../../../icecream_page.dart';

class BodyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(30)),
            DiscountBanner(),
          ],
        ),
      ),
    );
  }
}
