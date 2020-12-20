import 'package:flutter/material.dart';
import 'package:cookie/components/icecream_card.dart';
import 'package:cookie/models/ice_cream.dart';
import 'package:cookie/models/sweets.dart';
import 'package:cookie/screens/details/details_screen.dart';

class BodyIceCream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: ListView(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height - 50.0,
                  width: MediaQuery.of(context).size.width - 50.0,
                  child: GridView.count(
                    crossAxisCount: 2,
                    primary: false,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 15.0,
                    childAspectRatio: 0.8,
                    children: [
                      ...List.generate(
                        allIceCream.length,
                        (index) => IceCreamCard(
                          icecreams: allIceCream[index],
                          press: () => Navigator.pushNamed(
                            context,
                            DetailsScreen.routeName,
                            arguments: SweetsDetailsArguments(
                              allSweets: allSweets[index],
                            ),
                          ),
                        ),
                      )
                    ],
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
