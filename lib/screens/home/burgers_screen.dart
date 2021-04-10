import 'package:cookie/components/default_button_grey.dart';
import 'package:cookie/models/items.dart';
import 'package:cookie/screens/home/components/item_card.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BurgersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sweetData = Provider.of<Sweets>(context);
    final burgers = sweetData.allBurgers;
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
              // ---------------------------------------------
              child: GridView.count(
                shrinkWrap: true,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 20.0,
                crossAxisCount: 2,
                childAspectRatio:
                    (SizeConfig.itemWidth / SizeConfig.itemHeight),
                children: [
                  ...List.generate(burgers.length, (index) {
                    return ChangeNotifierProvider.value(
                      value: burgers[index],
                      child: ItemCard(),
                    );
                  }),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
