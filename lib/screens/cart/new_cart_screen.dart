import 'dart:convert';

import 'package:cookie/firebase/firebase_action.dart';
import 'package:cookie/size_config.dart';
import 'package:cookie/models/donut.dart';
import 'package:cookie/models/newCart.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';

class CartDetail extends StatefulWidget {
  CartDetail({Key key}) : super(key: key);

  @override
  _CartDetailState createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {
  List<NewCart> newCarts = new List<NewCart>.empty(growable: true);
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Center(
            child: Text('Cart'),
          ),
        ),
        body: Container(
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
            child: StreamBuilder(
                stream: FirebaseDatabase.instance
                    .reference()
                    .child('NewCart')
                    .child('UNIQUE_USER_ID')
                    .onValue,
                builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
                  if (snapshot.hasData) {
                    var map =
                        snapshot.data.snapshot.value as Map<dynamic, dynamic>;
                    newCarts.clear();
                    if (map != null) {
                      map.forEach((key, value) {
                        var newCart = new NewCart.fromJson(
                            json.decode(json.encode(value)));
                        newCart.key = key;
                        newCarts.add(newCart);
                      });
                    }
                    return newCarts.length > 0
                        ? ListView.builder(
                            itemCount: newCarts.length,
                            padding:
                                EdgeInsets.all(getProportionateScreenWidth(2)),
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Card(
                                    elevation: 8,
                                    margin: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenWidth(10),
                                      vertical: getProportionateScreenWidth(6),
                                    ),
                                    // onTap: () {
                                    //   addToCart(_scaffoldKey, donuts[index]);
                                    // },
                                    child: Container(
                                      padding: EdgeInsets.all(
                                          getProportionateScreenWidth(8)),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
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
                                      // ! - buildItemCard was here
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // Expanded(
                                          //   flex: 2,
                                          //   child: ClipRRect(
                                          //     child: Image(
                                          //       image: NetworkImage(
                                          //           newCarts[index].image),
                                          //       fit: BoxFit.cover,
                                          //     ),
                                          //     borderRadius: BorderRadius.all(
                                          //       Radius.circular(
                                          //           getProportionateScreenWidth(
                                          //               4)),
                                          //     ),
                                          //   ),
                                          // ),
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  bottom:
                                                      getProportionateScreenWidth(
                                                          8)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal:
                                                            getProportionateScreenWidth(
                                                                8)),
                                                    child: Text(
                                                      newCarts[index].title,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal:
                                                            getProportionateScreenWidth(
                                                                8)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            '\$${newCarts[index].price}'),
                                                        ElegantNumberButton(
                                                            initialValue:
                                                                newCarts[index]
                                                                    .quantity,
                                                            buttonSizeHeight:
                                                                getProportionateScreenWidth(
                                                                    20),
                                                            buttonSizeWidth:
                                                                getProportionateScreenWidth(
                                                                    25),
                                                            color: Colors
                                                                .transparent,
                                                            minValue: 1,
                                                            maxValue: 99,
                                                            onChanged:
                                                                (value) async {
                                                              // update quantity
                                                            },
                                                            decimalPlaces: 0),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          getProportionateScreenWidth(8)),
                                      child: IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: () {
                                          deleteCart(
                                              scaffoldKey, newCarts[index]);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          )
                        : Center(
                            child: Text('Пустая корзина'),
                          );
                  } else
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                }),
          ),
        ));
  }
  //   Widget buildItemCard(int index) {
  //   return Column(
  //     children: [
  //       Flexible(
  //         child: Container(
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: [
  //               Container(
  //                 decoration: BoxDecoration(
  //                   color: Color.fromRGBO(241, 240, 246, 2.0),
  //                   borderRadius: BorderRadius.only(
  //                     topRight: Radius.circular(20),
  //                     bottomLeft: Radius.circular(30),
  //                   ),
  //                 ),
  //                 child: Padding(
  //                   padding: EdgeInsets.symmetric(
  //                     horizontal: getProportionateScreenWidth(20),
  //                     vertical: getProportionateScreenWidth(12),
  //                   ),
  //                   child: Text(
  //                     '${donuts[index].price}₽',
  //                     style: TextStyle(
  //                       fontWeight: FontWeight.w600,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //       Flexible(
  //         child: Container(
  //           child: Padding(
  //             padding: EdgeInsets.only(
  //               bottom: getProportionateScreenWidth(10),
  //             ),
  //             child: SizedBox(
  //               width: getProportionateScreenWidth(100),
  //               child: AspectRatio(
  //                 aspectRatio: 1,
  //                 // child: Image.network(
  //                 //     donuts[index].image),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //       Flexible(
  //         child: Container(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               FittedBox(
  //                 fit: BoxFit.contain,
  //                 child: Text(
  //                   '${donuts[index].title}',
  //                   textAlign: TextAlign.center,
  //                   style: TextStyle(
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.w600,
  //                     color: Colors.black,
  //                   ),
  //                 ),
  //               ),
  //               FittedBox(
  //                 fit: BoxFit.contain,
  //                 child: Text(
  //                   '${donuts[index].categories}',
  //                   style: TextStyle(
  //                     // fontSize: 12,
  //                     color: Colors.grey,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //       Flexible(
  //         child: Container(
  //           child: Padding(
  //             padding: EdgeInsets.only(
  //               left: getProportionateScreenWidth(15),
  //               right: getProportionateScreenWidth(15),
  //               top: getProportionateScreenWidth(15),
  //             ),
  //             child: Container(
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   InkWell(
  //                     splashColor: Colors.transparent,
  //                     onTap: () {
  //                       // tapFavourite();
  //                     },
  //                     // child: item.isFavorite
  //                     //     ? Icon(Icons.favorite)
  //                     //     : Icon(Icons.favorite_outline),
  //                     child: Icon(Icons.favorite_outline),
  //                   ),
  //                   InkWell(
  //                     onTap: () {},
  //                     child: Text(
  //                       '${donuts[index].rating}',
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.w600,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
