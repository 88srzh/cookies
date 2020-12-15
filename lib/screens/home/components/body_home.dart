import 'package:cookie/screens/home/components/categories.dart';
import 'package:cookie/screens/home/components/discount_banner.dart';
import 'package:cookie/screens/home/components/home_header.dart';
import 'package:cookie/screens/home/components/popular_sweets.dart';
import 'package:cookie/screens/home/components/special_offers.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class BodyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: getProportionateScreenWidth(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(30)),
            DiscountBanner(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Categories(),
            SizedBox(height: getProportionateScreenWidth(30)),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularSweets(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
