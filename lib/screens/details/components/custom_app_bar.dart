import 'package:cookie/components/rounded_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class CustomAppBar extends PreferredSize {
  final double rating;

  CustomAppBar(this.rating);
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(10),
          right: getProportionateScreenWidth(20),
          top: getProportionateScreenWidth(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedIconBtn(
              // iconData: Icons.arrow_back_ios,
              iconData: Icons.arrow_back,
              press: () => Navigator.pop(context),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                child: Row(
                  children: [
                    Text(
                      rating.toString(),
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 5),
                    SvgPicture.asset('assets/icons/Star-Icon.svg'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
