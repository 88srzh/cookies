import 'dart:convert';

import 'package:cookie/firebase/firebase_action.dart';
import 'package:cookie/models/description.dart';
import 'package:cookie/models/item.dart';
import 'package:cookie/size_config.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PizzaScreen extends StatefulWidget {
  @override
  _PizzaScreenState createState() => _PizzaScreenState();
}

class _PizzaScreenState extends State<PizzaScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  List<Item> pizza = new List<Item>.empty(growable: true);
  List<DescriptionsItem> description =
  new List<DescriptionsItem>.empty(growable: true);
  GlobalKey<ScaffoldState> _scaffoldKeyPizza = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _scaffoldKeyPizza,
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
              child: StreamBuilder(
                stream: FirebaseDatabase.instance
                    .reference()
                    .child('Pizza')
                    .onValue,
                builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
                  if (snapshot.hasData) {
                    var map = snapshot.data.snapshot.value;
                    pizza.clear();
                    map.forEach((key, value) {
                      var pizzas = new Item.fromJson(json.decode(
                          json.encode(value)));
                      pizzas.key = key;
                      pizza.add(pizzas);
                    });
                    return StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        itemCount: pizza.length,
                        padding: EdgeInsets.all(getProportionateScreenWidth(2)),
                        mainAxisSpacing: getProportionateScreenWidth(10),
                        crossAxisSpacing: getProportionateScreenWidth(6),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            child: GestureDetector(
                              onTap: () {
                                // addToCart(_scaffoldKey, burgers[index]);
                                redirectToDescriptionPancakes(
                                    _scaffoldKey, pizza[index]);
                                // Navigator.of(context)
                                //     .pushNamed('/descriptionPage');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    // stops: [0.3, 1.8],
                                    colors: [
                                      Color.fromRGBO(248, 219, 221, 1.0),
                                      Colors.orange[100]
                                    ],
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: getProportionateScreenWidth(8)),
                                  child: buildItemCard(index),
                                ),
                              ),
                            ),
                          );
                        },
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.count(1, index.isEven ? 1.1 : 1.0));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItemCard(int index) {
    return Column(
      children: [
        Expanded(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    // color: Color.fromRGBO(241, 240, 246, 2.0),
                    color: Color.fromRGBO(245, 163, 157, 255),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenWidth(10),
                    ),
                    child: Text(
                      '${pizza[index].price}₽',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          // ! - repair text if not image
          flex: 2,
          child: ClipRRect(
            child: Image(
              image: NetworkImage(
                  pizza[index].image == "" ? 'NO IMAGE' : pizza[index].image),
            ),
          ),
        ),
        Flexible(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text('${pizza[index].title}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text('${pizza[index].categories}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(15),
                right: getProportionateScreenWidth(15),
                top: getProportionateScreenWidth(15),
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: () async {
                      pizza[index].isFavorite = false;
                        pizza[index].favoriteCount += 1;
                        pizza[index].isFavorite = true;
                        pizza[index].rating = pizza[index].favoriteCount
                            .toDouble() / 1.1;
                        pizza[index].rating = double.parse(pizza[index].rating
                            .toStringAsFixed(1));
                        updateItemCardRatingToPizza(
                            _scaffoldKeyPizza, pizza[index]);
                        },
                      child: pizza[index].isFavorite
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_outline),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        '${pizza[index].rating}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
