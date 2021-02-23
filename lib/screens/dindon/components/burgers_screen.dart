import 'package:cookie/components/default_button_grey.dart';
import 'package:cookie/models/sweets.dart';
import 'package:cookie/screens/dindon/components/donut_card.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BurgersScreen extends StatelessWidget {
  // final Sweets sweets;
  // final GestureTapCallback press;

  const BurgersScreen({Key key}) : super(key: key);

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
              // child: GridView.builder(
              //   physics: ScrollPhysics(),
              //   shrinkWrap: true,
              //   itemCount: sweets.length,
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2),
              //   itemBuilder: (context, index) => ChangeNotifierProvider.value(
              //     value: sweets[index],
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: DonutCard(
              //         title: sweets[index].title,
              //         rating: sweets[index].rating,
              //         price: sweets[index].price,
              //         images: sweets[index].images,
              //       ),
              //     ),
              //   ),
              // ),
              // ---------------------------------------------
              child: GridView.count(
                shrinkWrap: true,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 20.0,
                crossAxisCount: 2,
                childAspectRatio:
                    (SizeConfig.itemWidth / SizeConfig.itemHeight),
                children: [
                  ...List.generate(sweets.length, (index) {
                    if (sweets[index].isBurgers)
                      return ChangeNotifierProvider.value(
                        value: sweets[index],
                        child: DonutCard(
                          title: sweets[index].title,
                          images: sweets[index].images,
                          rating: sweets[index].rating,
                          price: sweets[index].price,
                          // isDonuts: sweets[index].isBurgers,
                        ),
                      );
                    return SizedBox.shrink();
                  }),
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
