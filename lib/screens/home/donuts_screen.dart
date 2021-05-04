import 'dart:convert';

import 'package:cookie/firebase/firebase_action.dart';
import 'package:cookie/models/item.dart';
import 'package:cookie/models/cart.dart';
// import 'package:cookie/screens/description/descriprion_screen.dart';
import 'package:cookie/size_config.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DonutsScreen extends StatefulWidget {
  @override
  _DonutsScreenState createState() => _DonutsScreenState();
}

class _DonutsScreenState extends State<DonutsScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  List<Item> item = new List<Item>.empty(growable: true);
  List<Cart> newCarts = new List<Cart>.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _scaffoldKey,
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
              child: StreamBuilder(
                stream: FirebaseDatabase.instance
                    .reference()
                    .child('Donuts')
                    .onValue,
                builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
                  if (snapshot.hasData) {
                    var map =
                        snapshot.data.snapshot.value as Map<dynamic, dynamic>;
                    item.clear();
                    if (map != null) {
                      map.forEach((key, value) {
                        var donut =
                            new Item.fromJson(json.decode(json.encode(value)));
                        donut.key = key;
                        item.add(donut);
                      });
                    }
                    return StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        itemCount: item.length,
                        padding: EdgeInsets.all(getProportionateScreenWidth(2)),
                        mainAxisSpacing: getProportionateScreenWidth(10),
                        crossAxisSpacing: getProportionateScreenWidth(6),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            child: GestureDetector(
                              onTap: () {
                                addToCart(_scaffoldKey, item[index]);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color.fromRGBO(248, 219, 221, 1.0),
                                        Colors.orange[100]
                                      ]),
                                ),
                                child: buildItemCard(index),
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
        Flexible(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(241, 240, 246, 2.0),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(30))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20),
                        vertical: getProportionateScreenWidth(10)),
                    child: Text('${item[index].price}₽',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          // ! - repair text if not image
          flex: 2,
          child: ClipRRect(
            child: Image(
              image: NetworkImage(
                  item[index].image == "" ? 'NO IMAGE' : item[index].image),
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
                  child: Text('${item[index].title}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text('${item[index].categories}',
                      style: TextStyle(color: Colors.grey)),
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
                  top: getProportionateScreenWidth(15)),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        // tapFavourite();
                      },
                      // child: item.isFavorite
                      //     ? Icon(Icons.favorite)
                      //     : Icon(Icons.favorite_outline),
                      child: Icon(Icons.favorite_outline),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        '${item[index].rating}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
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
