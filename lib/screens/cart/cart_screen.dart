import 'dart:convert';

import 'package:cookie/firebase/firebase_action.dart';
import 'package:cookie/size_config.dart';
import 'package:cookie/models/cart.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key key}) : super(key: key);


  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var numberItemInCart = 0;
  List<Cart> newCarts = new List<Cart>.empty(growable: true);
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  var totalQuantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Center(child: Text('Корзина', style: TextStyle(color: Colors.black87))),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]]),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(3), vertical: getProportionateScreenWidth(4)),
          child: StreamBuilder(
              stream: FirebaseDatabase.instance.reference().child('NewCart').child('UNIQUE_USER_ID').onValue,
              builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
                if (snapshot.hasData) {
                  var map = snapshot.data.snapshot.value as Map<dynamic, dynamic>;
                  newCarts.clear();
                  if (map != null) {
                    map.forEach((key, value) {
                      var newCart = new Cart.fromJson(json.decode(json.encode(value)));
                      newCart.key = key;
                      newCarts.add(newCart);
                    });
                    numberItemInCart = newCarts
                        .map<int>((m) => m.quantity)
                        .reduce((s1, s2) => s1 + s2);
                  }
                  return newCarts.length > 0
                      ? ListView.builder(
                          itemCount: newCarts.length,
                          padding: EdgeInsets.all(getProportionateScreenWidth(2)),
                          itemBuilder: (context, index) {
                            return Slidable(
                              actionPane: const SlidableDrawerActionPane(),
                              secondaryActions: <Widget>[
                                IconSlideAction(
                                  caption: 'Удалить',
                                  color: Colors.red,
                                  icon: Icons.delete,
                                  onTap: () async {
                                          showDialog(
                                              context: context,
                                              builder: (context) => Scaffold(
                                                backgroundColor: Colors.transparent,
                                                body: Builder(
                                                  builder: (context) => AlertDialog(
                                                    contentPadding: EdgeInsets.all(0.0),
                                                    backgroundColor: Colors.transparent,
                                                    content: Container(
                                                      height: SizeConfig.screenHeight * 0.165,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(20)),
                                                      child: Column(
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets.only(top: getProportionateScreenWidth(10)),
                                                              child: Text('Удалить товар', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                                  ),
                                                            Divider(),
                                                          Padding(
                                                              padding: EdgeInsets.only(
                                                                  left: getProportionateScreenWidth(15),
                                                                  right: getProportionateScreenWidth(15),
                                                                  top: getProportionateScreenWidth(8),
                                                                  bottom: getProportionateScreenWidth(15),
                                                              ),
                                                            child: Text('Вы точно хотите удалить товар из списка?', style: TextStyle(fontSize: 14), textAlign: TextAlign.center),
                                                          ),
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: ElevatedButton(
                                                                      style: ButtonStyle(
                                                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[300]),
                                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                          RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
                                                                            side: BorderSide(color: Colors.grey[300]),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      onPressed: () => Navigator.pop(context),
                                                                      child: Padding(
                                                                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(12)),
                                                                        child: Text('Отмена'.toUpperCase(), style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
                                                                      )),
                                                                ),
                                                                Expanded(
                                                                  child: ElevatedButton(
                                                                      style: ButtonStyle(
                                                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                          RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
                                                                            side: BorderSide(color: Colors.redAccent),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      onPressed: () async {
                                                                        deleteCart(_scaffoldKey, newCarts[index]);
                                                                        return Navigator.pop(context);
                                                                      },
                                                                      child: Padding(
                                                                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(12)),
                                                                        child: Text('Удалить'.toUpperCase(), style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                                                                      )),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                       ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                        },
                                ),
                              ],
                              child: Stack(
                                children: [
                                  Card(
                                    elevation: 8,
                                    margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenWidth(6)),
                                    // onTap: () {
                                    //   addToCart(_scaffoldKey, item[index]);
                                    // },
                                    child: Container(
                                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]]),
                                      ),
                                      // ! - buildItemCard here
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: ClipRRect(
                                              child: Image(
                                                image: NetworkImage(newCarts[index].image),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(getProportionateScreenWidth(4))),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              padding: EdgeInsets.only(bottom: getProportionateScreenWidth(8)),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
                                                    child: Text(
                                                      newCarts[index].title,
                                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(2)),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text('Всего: \ ${newCarts[index].totalPrice}₽', style: TextStyle(fontSize: 18)),
                                                        ElegantNumberButton(
                                                          initialValue: newCarts[index].quantity,
                                                          buttonSizeHeight: getProportionateScreenWidth(20),
                                                          buttonSizeWidth: getProportionateScreenWidth(25),
                                                          color: Colors.transparent,
                                                          minValue: 1,
                                                          maxValue: 99,
                                                          onChanged: (value) async {
                                                            newCarts[index].quantity = value;
                                                            newCarts[index].totalPrice = double.parse(newCarts[index].price) * newCarts[index].quantity;
                                                            totalQuantity = newCarts[index].quantity + newCarts[index].quantity;
                                                            updateToCart(_scaffoldKey, newCarts[index]);
                                                          },
                                                          decimalPlaces: 0,
                                                        ),
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
                                ],
                              ),
                            );
                          },
                        )
                      : Center(child: Text('Пустая корзина', style: TextStyle(fontSize: 30)));
                } else
                  return Center(child: CircularProgressIndicator());
              }),

        ),

      ),
      bottomNavigationBar:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text('Общее количество', style: TextStyle(fontSize: 16, ),),
              // Text('\$${newCarts.length > 0 ? newCarts.map<int>((m) => (int.parse(m.price) * m.quantity).reduce((value, element) => value + element).toStringAsFixed(2)) : 0}'),
              // ! - add total amount
              // Text('${numberInCart.toString()}')
            ],
          ),
        ),
    );
  }
}
