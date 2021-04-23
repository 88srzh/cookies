import 'dart:convert';

import 'package:cookie/models/item.dart';
import 'package:cookie/screens/description/descriprion_screen.dart';
import 'package:cookie/size_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PizzaScreen extends StatefulWidget {
  @override
  _PizzaScreenState createState() => _PizzaScreenState();
}

class _PizzaScreenState extends State<PizzaScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  List<Item> donuts = new List<Item>.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: getProportionateScreenWidth(20)),
          Expanded(
              child: StreamBuilder(
            stream:
                FirebaseDatabase.instance.reference().child('Donuts').onValue,
            builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
              if (snapshot.hasData) {
                var map = snapshot.data.snapshot.value as Map<dynamic, dynamic>;
                donuts.clear();
                map.forEach((key, value) {
                  var donut =
                      new Item.fromJson(json.decode(json.encode(value)));
                  donut.key = key;
                  donuts.add(donut);
                });
                return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: donuts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(
                            //     context, DescriptionScreen.routeName);
                          },
                          child: Text('${donuts[index].title}'),
                        ),
                      );
                    },
                    staggeredTileBuilder: (int index) =>
                        StaggeredTile.count(1, index.isEven ? 1.1 : 1.0));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
        ],
      ),
    );
  }
}
