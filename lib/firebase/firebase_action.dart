import 'dart:convert';

import 'package:cookie/models/item.dart';
import 'package:cookie/models/newCart.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void addToCart(GlobalKey<ScaffoldState> scaffoldKey, Item donut) {
  var cart = FirebaseDatabase.instance
      .reference()
      .child('NewCart')
      .child('UNIQUE_USER_ID');
  cart.child(donut.key).once().then((DataSnapshot snapshot) {
    //  If user already have item in cart
    if (snapshot.value != null) {
      var newCart = NewCart.fromJson(json.decode(json.encode(snapshot.value)));
      newCart.quantity += 1;
      newCart.totalPrice = double.parse(donut.price) * newCart.quantity;
      cart
          .child(donut.key)
          .set(newCart.toJson())
          .then((value) => ScaffoldMessenger.of(scaffoldKey.currentContext)
              .showSnackBar(SnackBar(content: Text('Update successfully'))))
          .catchError((e) => ScaffoldMessenger.of(scaffoldKey.currentContext)
              .showSnackBar(SnackBar(content: Text('$e'))));
    } else {
      // If user don't have item in cart
      NewCart newCart = new NewCart(
          title: donut.title,
          image: donut.image,
          key: donut.key,
          price: donut.price,
          quantity: 1,
          totalPrice: double.parse(donut.price));
      cart
          .child(donut.key)
          .set(newCart.toJson())
          .then((value) => ScaffoldMessenger.of(scaffoldKey.currentContext)
              .showSnackBar(
                  SnackBar(content: Text('Add to cart successfully'))))
          .catchError((e) => ScaffoldMessenger.of(scaffoldKey.currentContext)
              .showSnackBar(SnackBar(content: Text('$e'))));
    }
  });
}

void updateToCart(GlobalKey<ScaffoldState> scaffoldKey, NewCart newCart) {
  var cart = FirebaseDatabase.instance
      .reference()
      .child('NewCart')
      .child('UNIQUE_USER_ID');
  cart
      .child(newCart.key)
      .set(newCart.toJson())
      .then((value) => ScaffoldMessenger.of(scaffoldKey.currentContext)
          .showSnackBar(SnackBar(content: Text('Add to cart successfully'))))
      .catchError((e) => ScaffoldMessenger.of(scaffoldKey.currentContext)
          .showSnackBar(SnackBar(content: Text('$e'))));
}

void deleteCart(GlobalKey<ScaffoldState> scaffoldKey, NewCart newCart) {
  var cart = FirebaseDatabase.instance
      .reference()
      .child('NewCart')
      .child('UNIQUE_USER_ID');
  cart
      .child(newCart.key)
      .remove()
      .then((value) => ScaffoldMessenger.of(scaffoldKey.currentContext)
          .showSnackBar(
              SnackBar(content: Text('Remove from cart successfully'))))
      .catchError((e) => ScaffoldMessenger.of(scaffoldKey.currentContext)
          .showSnackBar(SnackBar(content: Text('$e'))));
}
