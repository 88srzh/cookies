import 'package:cookie/components/default_button_grey.dart';
import 'package:cookie/models/sweets.dart';
import 'package:cookie/screens/dindon/components/dindon_screen.dart';
import 'package:cookie/screens/dindon/components/donut_card.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyDindonMainScreen extends StatelessWidget {
  // final Sweets sweets;
  // final GestureTapCallback press;

  const BodyDindonMainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sweetData = Provider.of<Sweets>(context);
    final sweets = sweetData.allSweets;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // stops: [0.3, 1.8],
          colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]],
        ),
      ),
      child: Padding(
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
                childAspectRatio:
                    (SizeConfig.itemWidth / SizeConfig.itemHeight),
                children: [
                  ...List.generate(
                    // CatalogModel().allSweets.length,
                    sweets.length,
                    (index) {
                      return DonutCard(
                        // sweets: CatalogModel().allSweets[index],
                        sweets: sweetData,
                        press: () => Navigator.pushNamed(
                          context,
                          DindonScreen.routeName,
                          arguments: AllSweetsDetailsArguments(
                            // allSweets: CatalogModel().allSweets[index],
                            allSweets: sweetData,
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
                DefaultButtonGrey(
                  text: 'Показать еще',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
