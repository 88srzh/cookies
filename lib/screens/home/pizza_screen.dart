import 'package:cookie/models/items.dart';
import 'package:cookie/screens/home/components/item_card.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PizzaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sweetData = Provider.of<Sweets>(context);
    final sweets = sweetData.allSweets;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
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
              child: GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: sweets.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: sweets[index],
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                    child: ItemCard(),
                  ),
                ),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
