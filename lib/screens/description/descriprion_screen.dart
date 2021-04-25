import 'dart:convert';
import 'dart:ui';

import 'package:cookie/components/custom_box_shadow.dart';
import 'package:cookie/models/description.dart';
import 'package:cookie/screens/description/components/ingredient_card.dart';
import 'package:cookie/size_config.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DescriptionScreen extends StatefulWidget {
  // static const routeName = '/description';
  DescriptionScreen({Key key}) : super(key: key);

  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  List<DescriptionsItem> description =
      new List<DescriptionsItem>.empty(growable: true);
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Center(
          child: Text('Описание'),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]]),
        ),
        child: StreamBuilder(
            stream: FirebaseDatabase.instance
                .reference()
                .child('DescriptionItem')
                .child('Items')
                .onValue,
            builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
              if (snapshot.hasData) {
                var map = snapshot.data.snapshot.value as Map<dynamic, dynamic>;
                description.clear();
                if (map != null) {
                  map.forEach((key, value) {
                    var newDescription = new DescriptionsItem.fromJson(
                        json.decode(json.encode(value)));
                    newDescription.key = key;
                    description.add(newDescription);
                  });
                }
                return ListView.builder(
                  itemCount: description.length,
                  itemBuilder: (context, index) {
                    // return buildDescriptionCard(index);
                    return Column(
                      children: [
                        SizedBox(
                          width: getProportionateScreenWidth(250),
                          height: getProportionateScreenHeight(240),
                          child: ClipRRect(
                            child: Image(
                              image: NetworkImage(description[index].image),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: getProportionateScreenWidth(40),
                            left: getProportionateScreenWidth(20),
                            right: getProportionateScreenWidth(20),
                            bottom: getProportionateScreenWidth(7),
                          ),
                          /* ingredients */
                          child: Row(
                            children: [
                              Text(
                                'Ингредиенты',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                            getProportionateScreenWidth(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildIngredientCard(
                                index,
                                titleCard: 'Белки',
                                gramm: description[index].sugarGramm,
                                percent: description[index].sugar,
                              ),
                              buildIngredientCard(
                                index,
                                titleCard: 'Жиры',
                                gramm: description[index].saltGramm,
                                percent: description[index].salt,
                              ),
                              buildIngredientCard(
                                index,
                                titleCard: 'Углеводы',
                                gramm: description[index].fatGramm,
                                percent: description[index].fat,
                              ),
                              buildIngredientCard(
                                index,
                                titleCard: 'Энергия',
                                gramm: description[index].energyGramm,
                                percent: description[index].energy,
                              ),
                            ],
                          ),
                        ),
                        /* description */
                        Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: getProportionateScreenHeight(10),
                                    left: getProportionateScreenWidth(20),
                                    right: getProportionateScreenWidth(20),
                                  ),
                                  child: Text(
                                    'Описание',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Container(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: getProportionateScreenWidth(5),
                                        left: getProportionateScreenWidth(20),
                                        right: getProportionateScreenWidth(20),
                                      ),
                                      child: Text(
                                        '${description[index].description}',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                    // return description.length > 0
                    //     ? ListView.builder(
                    //         itemCount: description.length,
                    //         itemBuilder: (context, index) {
                    //           return buildDescriptionCard();
                    //         })
                    //     : Center(
                    //         child: Text('empty'),
                    //       );
                  },
                );
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            }),
      ),
    );
  }

  Container buildIngredientCard(int index, {String titleCard, gramm, percent}) {
    return Container(
      width: getProportionateScreenWidth(75),
      height: getProportionateScreenHeight(140),
      padding: EdgeInsets.only(
        top: getProportionateScreenWidth(10),
        left: getProportionateScreenWidth(5),
        right: getProportionateScreenWidth(5),
        bottom: getProportionateScreenWidth(4),
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(250, 237, 238, 0.6),
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          CustomBoxShadow(
            color: Colors.black26,
            offset: Offset(1.0, 1.0),
            blurRadius: 1.0,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            '$titleCard',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            // '${description[index].fatGramm}',
            '$gramm',
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(80),
              ),
              child: Text(
                // '${description[index].fat}%',
                '$percent%',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              width: getProportionateScreenWidth(42),
              height: getProportionateScreenHeight(50),
            ),
          ),
        ],
      ),
    );
  }
}
