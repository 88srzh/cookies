import 'dart:convert';

import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:cookie/firebase/firebase_action.dart';
import 'package:cookie/size_config.dart';
// import 'package:cookie/models/item.dart';
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
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Корзина',
            style: TextStyle(color: Colors.black87),
          ),
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
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(3),
              vertical: getProportionateScreenWidth(4)),
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
                      var newCart =
                          new NewCart.fromJson(json.decode(json.encode(value)));
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
                                    horizontal: getProportionateScreenWidth(10),
                                    vertical: getProportionateScreenWidth(6),
                                  ),
                                  // onTap: () {
                                  //   addToCart(_scaffoldKey, item[index]);
                                  // },
                                  child: Container(
                                    padding: EdgeInsets.all(
                                        getProportionateScreenWidth(8)),
                                    decoration: BoxDecoration(
                                      // borderRadius:
                                      //     BorderRadius.all(Radius.circular(30)),
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
                                        Expanded(
                                          flex: 2,
                                          child: ClipRRect(
                                            child: Image(
                                              image: NetworkImage(
                                                  newCarts[index].image),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  getProportionateScreenWidth(
                                                      4)),
                                            ),
                                          ),
                                        ),
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
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          getProportionateScreenWidth(
                                                              2)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Всего: \ ${newCarts[index].totalPrice}₽',
                                                        style: TextStyle(
                                                            fontSize: 18),
                                                      ),
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
                                                            newCarts[index]
                                                                    .quantity =
                                                                value;
                                                            newCarts[index]
                                                                .totalPrice = double
                                                                    .parse(newCarts[
                                                                            index]
                                                                        .price) *
                                                                newCarts[index]
                                                                    .quantity;
                                                            updateToCart(
                                                                _scaffoldKey,
                                                                newCarts[
                                                                    index]);
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
                                      onPressed: () async {
                                        if (await confirm(context,
                                            title: Text('Удалить товар'),
                                            content: Text(
                                                'Точно хотите удалить из списка?'),
                                            textOK: Text(
                                              'Удалить',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                            textCancel: Text('Отмена'))) {
                                          return deleteCart(
                                              _scaffoldKey, newCarts[index]);
                                        }
                                        deleteCart(
                                            _scaffoldKey, newCarts[index]);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            'Пустая корзина',
                            style: TextStyle(fontSize: 30),
                          ),
                        );
                } else
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              }),
        ),
      ),
    );
  }
}
