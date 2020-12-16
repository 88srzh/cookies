import 'package:cookie/components/default_button.dart';
import 'package:cookie/models/sweets.dart';
import 'package:cookie/screens/details/components/color_dots.dart';
import 'package:cookie/screens/details/components/product_description.dart';
import 'package:cookie/screens/details/components/sweets_images.dart';
import 'package:cookie/screens/details/components/top_rounded_container.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class BodyDetails extends StatelessWidget {
  final Sweets allSweets;

  const BodyDetails({Key key, @required this.allSweets}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SweetsImages(allSweets: allSweets),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  allSweets: allSweets,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      ColorDots(allSweets: allSweets),
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.15,
                            right: SizeConfig.screenWidth * 0.15,
                            top: getProportionateScreenWidth(15),
                            bottom: getProportionateScreenWidth(40),
                          ),
                          child: DefaultButton(
                            text: 'Добавить в корзину',
                            press: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}