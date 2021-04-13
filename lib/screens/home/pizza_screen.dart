import 'dart:convert';

import 'package:cookie/models/donut.dart';
import 'package:cookie/size_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PizzaScreen extends StatefulWidget {
  @override
  _PizzaScreenState createState() => _PizzaScreenState();
}

class _PizzaScreenState extends State<PizzaScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  List<Donut> donuts = new List<Donut>.empty(growable: true);
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
                      new Donut.fromJson(json.decode(json.encode(value)));
                });
                return Center();
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
