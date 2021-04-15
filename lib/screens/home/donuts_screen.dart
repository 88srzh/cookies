import 'dart:convert';

import 'package:cookie/models/donut.dart';
import 'package:cookie/screens/description/descriprion_screen.dart';
import 'package:cookie/size_config.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DonutsScreen extends StatefulWidget {
  @override
  _DonutsScreenState createState() => _DonutsScreenState();
}

class _DonutsScreenState extends State<DonutsScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  List<Donut> donuts = new List<Donut>.empty(growable: true);

  @override
  Widget build(BuildContext context) {
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
              child: StreamBuilder(
                stream: FirebaseDatabase.instance
                    .reference()
                    .child('Donuts')
                    .onValue,
                builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
                  if (snapshot.hasData) {
                    var map =
                        snapshot.data.snapshot.value as Map<dynamic, dynamic>;
                    donuts.clear();
                    map.forEach((key, value) {
                      var donut =
                          new Donut.fromJson(json.decode(json.encode(value)));
                      donut.key = key;
                      donuts.add(donut);
                    });
                    return StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        itemCount: donuts.length,
                        padding: EdgeInsets.all(getProportionateScreenWidth(2)),
                        mainAxisSpacing: getProportionateScreenWidth(4),
                        crossAxisSpacing: getProportionateScreenWidth(4),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                // height: 100,
                                decoration: BoxDecoration(
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
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigator.pushNamed(context, DescriptionScreen.routeName);
                                    Navigator.of(context).pushNamed(
                                        DescriptionScreen.routeName,
                                        arguments: donuts[index].key);
                                    // Navigator.pushNamed(
                                    //     context, DescriptionScreen.routeName);
                                  },
                                  child: buildItemCard(index),
                                ),
                              ),
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
              ),
              // -----------------------Firestore Database---------------------
              //   child: StreamBuilder(
              //     stream:
              //         FirebaseFirestore.instance.collection('Items').snapshots(),
              //     builder: (context, snapshot) {
              //       if (!snapshot.hasData) return const Text('Loading...');
              //       // -----------------------------------------------------
              //       return GridView.count(
              //         crossAxisCount: 2,
              //         shrinkWrap: true,
              //         mainAxisSpacing: 15.0,
              //         crossAxisSpacing: 20.0,
              //         childAspectRatio:
              //             (SizeConfig.itemWidth / SizeConfig.itemHeight),
              //         children: [
              //           ...List.generate(snapshot.data.docs.length, (index) {
              //             return buildItemCard(
              //                 context, snapshot.data.docs[index]);
              //           })
              //         ],
              //       );
              //     },
              //   ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   // crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     DefaultButtonGrey(
            //       text: 'Показать еще',
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Column buildItemCard(int index) {
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
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenWidth(12),
                    ),
                    child: Text(
                      '${donuts[index].price}₽',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
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
                bottom: getProportionateScreenWidth(10),
              ),
              child: SizedBox(
                width: getProportionateScreenWidth(100),
                child: AspectRatio(
                  aspectRatio: 1,
                  // child: Image.network(
                  //     donuts[index].image),
                ),
              ),
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
                  child: Text(
                    '${donuts[index].title}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    '${donuts[index].categories}',
                    style: TextStyle(
                      // fontSize: 12,
                      color: Colors.grey,
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
                      onTap: () {
                        // tapFavourite();
                      },
                      // child: item.isFavorite
                      //     ? Icon(Icons.favorite)
                      //     : Icon(Icons.favorite_outline),
                      child: Icon(Icons.favorite_outline),
                    ),
                    InkWell(
                      onTap: () {
                        // FirebaseFirestore.instance
                        //     .runTransaction((transaction) async {
                        //   DocumentSnapshot freshSnap =
                        //       await transaction.get(docs.reference);
                        //   await transaction.update(freshSnap.reference,
                        //       {'rating': freshSnap['rating'] + 1});
                        // });
                      },
                      child: Text(
                        '${donuts[index].rating}',
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

  // Widget buildItemCard(BuildContext context, DocumentSnapshot docs) {
  //   return Container(
  //     // height: 100,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.all(Radius.circular(30)),
  //       gradient: LinearGradient(
  //         begin: Alignment.topLeft,
  //         end: Alignment.bottomRight,
  //         // stops: [0.3, 1.8],
  //         colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]],
  //       ),
  //     ),
  //     child: GestureDetector(
  //       onTap: () {
  //         // Navigator.pushNamed(context, DescriptionScreen.routeName);
  //         // Navigator.of(context)
  //         //     .pushNamed(DescriptionScreen.routeName, arguments: docs['id']);
  //         // Navigator.pushNamed(context, DescriptionScreen.routeName);
  //       },
  //       child: Column(
  //         children: [
  //           Flexible(
  //             child: Container(
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 children: [
  //                   Container(
  //                     decoration: BoxDecoration(
  //                       color: Color.fromRGBO(241, 240, 246, 2.0),
  //                       borderRadius: BorderRadius.only(
  //                         topRight: Radius.circular(20),
  //                         bottomLeft: Radius.circular(30),
  //                       ),
  //                     ),
  //                     child: Padding(
  //                       padding: EdgeInsets.symmetric(
  //                         horizontal: getProportionateScreenWidth(20),
  //                         vertical: getProportionateScreenWidth(12),
  //                       ),
  //                       child: Text(
  //                         '${docs['price'].toString()}₽',
  //                         style: TextStyle(
  //                           fontWeight: FontWeight.w600,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           Flexible(
  //             child: Container(
  //               child: Padding(
  //                 padding: EdgeInsets.only(
  //                   bottom: getProportionateScreenWidth(10),
  //                 ),
  //                 child: SizedBox(
  //                   width: getProportionateScreenWidth(100),
  //                   child: AspectRatio(
  //                     aspectRatio: 1,
  //                     // child: Image.asset(docs['images']),
  //                     // child: Image.file(docs['images']),
  //                     // child: Image.network(src)
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           Flexible(
  //             child: Container(
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   FittedBox(
  //                     fit: BoxFit.contain,
  //                     child: Text(
  //                       '${docs['title']}',
  //                       textAlign: TextAlign.center,
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.w600,
  //                         color: Colors.black,
  //                       ),
  //                     ),
  //                   ),
  //                   FittedBox(
  //                     fit: BoxFit.contain,
  //                     child: Text(
  //                       '${docs['categories']}',
  //                       style: TextStyle(
  //                         // fontSize: 12,
  //                         color: Colors.grey,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           Flexible(
  //             child: Container(
  //               child: Padding(
  //                 padding: EdgeInsets.only(
  //                   left: getProportionateScreenWidth(15),
  //                   right: getProportionateScreenWidth(15),
  //                   top: getProportionateScreenWidth(15),
  //                 ),
  //                 child: Container(
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       InkWell(
  //                         splashColor: Colors.transparent,
  //                         onTap: () {
  //                           // tapFavourite();
  //                         },
  //                         // child: item.isFavorite
  //                         //     ? Icon(Icons.favorite)
  //                         //     : Icon(Icons.favorite_outline),
  //                         child: Icon(Icons.favorite_outline),
  //                       ),
  //                       InkWell(
  //                         onTap: () {
  //                           FirebaseFirestore.instance
  //                               .runTransaction((transaction) async {
  //                             DocumentSnapshot freshSnap =
  //                                 await transaction.get(docs.reference);
  //                             await transaction.update(freshSnap.reference,
  //                                 {'rating': freshSnap['rating'] + 1});
  //                           });
  //                         },
  //                         child: Text(
  //                           '${docs['rating'].toString()}',
  //                           style: TextStyle(
  //                             fontSize: 16,
  //                             fontWeight: FontWeight.w600,
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
