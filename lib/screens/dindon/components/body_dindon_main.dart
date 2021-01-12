import 'package:cookie/models/sweets.dart';
import 'package:cookie/screens/details/details_screen.dart';
import 'package:cookie/screens/dindon/components/dindon_screen.dart';
import 'package:cookie/screens/dindon/components/donut_card.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class BodyDindonMainScreen extends StatelessWidget {
  final Sweets sweets;
  // final GestureTapCallback press;

  const BodyDindonMainScreen({Key key, this.sweets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: getProportionateScreenWidth(10),
        left: getProportionateScreenWidth(15),
        right: getProportionateScreenWidth(15),
      ),
      child: Column(
        children: [
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 20.0,
              crossAxisCount: 2,
              childAspectRatio: (SizeConfig.itemWidth / SizeConfig.itemHeight),
              children: [
                ...List.generate(
                  4,
                  // 4,
                  // CatalogModel().allSweets.length,

                  (index) {
                    return DonutCard(
                      sweets: CatalogModel().allSweets[index],
                      press: () => Navigator.pushNamed(
                        context,
                        DindonScreen.routeName,
                        arguments: AllSweetsDetailsArguments(
                          allSweets: CatalogModel().allSweets[index],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(20),
                  // horizontal: getProportionateScreenWidth(30),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(241, 240, 246, 1.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(10),
                      horizontal: getProportionateScreenWidth(20),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        'Показать еще',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
