import 'dart:convert';

import 'package:cookie/models/description.dart';
import 'package:cookie/models/item.dart';
import 'package:cookie/models/cart.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void addToCart(GlobalKey<ScaffoldState> scaffoldKey, Item item) {
  var cart = FirebaseDatabase.instance
      .reference()
      .child('NewCart')
      .child('UNIQUE_USER_ID');
  cart.child(item.key).once().then((DataSnapshot snapshot) {
    //  If user already have item in cart
    if (snapshot.value != null) {
      var newCart = Cart.fromJson(json.decode(json.encode(snapshot.value)));
      newCart.quantity += 1;
      newCart.totalPrice = double.parse(item.price) * newCart.quantity;
      cart
          .child(item.key)
          .set(newCart.toJson())
          .then((value) => ScaffoldMessenger.of(scaffoldKey.currentContext)
              .showSnackBar(SnackBar(content: Text('Update successfully'))))
          .catchError((e) => ScaffoldMessenger.of(scaffoldKey.currentContext)
              .showSnackBar(SnackBar(content: Text('$e'))));
    } else {
      // If user don't have item in cart
      Cart newCart = new Cart(
          title: item.title,
          image: item.image,
          key: item.key,
          price: item.price,
          quantity: 1,
          totalPrice: double.parse(item.price));
      cart
          .child(item.key)
          .set(newCart.toJson())
          .then((value) => ScaffoldMessenger.of(scaffoldKey.currentContext)
              .showSnackBar(SnackBar(content: Text('Добавлено в корзину'))))
          .catchError((e) => ScaffoldMessenger.of(scaffoldKey.currentContext)
              .showSnackBar(SnackBar(content: Text('$e'))));
    }
  });
}

void updateToCart(GlobalKey<ScaffoldState> scaffoldKey, Cart newCart) {
  var cart = FirebaseDatabase.instance
      .reference()
      .child('NewCart')
      .child('UNIQUE_USER_ID');
  cart
      .child(newCart.key)
      .set(newCart.toJson())
      .then((value) => ScaffoldMessenger.of(scaffoldKey.currentContext)
          .showSnackBar(SnackBar(content: Text('Update to cart successfully'))))
      .catchError((e) => ScaffoldMessenger.of(scaffoldKey.currentContext)
          .showSnackBar(SnackBar(content: Text('$e'))));
}

void updateItemCardRatingToPizza(
    GlobalKey<ScaffoldState> scaffoldKey, Item items) {
  var item = FirebaseDatabase.instance.reference().child('Pizza');
  item
      .child(items.key)
      .set(items.toJson())
      .then((value) => ScaffoldMessenger.of(scaffoldKey.currentContext)
          .showSnackBar(SnackBar(content: Text('Рейтинг обновлен'))))
      .catchError((e) => ScaffoldMessenger.of(scaffoldKey.currentContext)
          .showSnackBar(SnackBar(content: Text('$e'))));
}

void deleteCart(GlobalKey<ScaffoldState> scaffoldKey, Cart newCart) {
  var cart = FirebaseDatabase.instance
      .reference()
      .child('NewCart')
      .child('UNIQUE_USER_ID');
  cart
      .child(newCart.key)
      .remove()
      .then((value) => ScaffoldMessenger.of(scaffoldKey.currentContext)
          .showSnackBar(SnackBar(content: Text('Удалено из корзины'))))
      .catchError((e) => ScaffoldMessenger.of(scaffoldKey.currentContext)
          .showSnackBar(SnackBar(content: Text('$e'))));
}

void redirectToDescription(GlobalKey<ScaffoldState> scaffoldKey, Item item) {
  var descScreen = FirebaseDatabase.instance
      .reference()
      .child('DescriptionItem')
      .child('Items');
  descScreen.child(item.key).once().then((DataSnapshot snapshot) {
    // If user already have item in description
    if (snapshot.value != null) {
      var newDescription =
          Item.fromJson(json.decode(json.encode(snapshot.value)));
      descScreen
          .child(item.key)
          .set(newDescription.toJson())
          .then((value) => ScaffoldMessenger.of(scaffoldKey.currentContext)
              .showSnackBar(SnackBar(content: Text('Update successfully'))))
          .catchError((e) => ScaffoldMessenger.of(scaffoldKey.currentContext)
              .showSnackBar(SnackBar(content: Text('$e'))));
    } else {
      DescriptionsItem description = new DescriptionsItem(
          key: item.key,
          title: item.title,
          price: item.price,
          image: item.image,
          description: item.description,
          sugar: item.sugar,
          fat: item.fat,
          energy: item.energy,
          salt: item.salt,
          energyGramm: item.energyGram,
          sugarGramm: item.sugarGram,
          saltGramm: item.saltGram,
          fatGramm: item.fatGram);
      descScreen
          .child(item.key)
          .set(description.toJson())
          .then((value) => ScaffoldMessenger.of(scaffoldKey.currentContext)
              .showSnackBar(SnackBar(content: Text('fucking work'))))
          .catchError((e) => ScaffoldMessenger.of(scaffoldKey.currentContext)
              .showSnackBar(SnackBar(content: Text('$e'))));
    }
  });
}

void redirectToDescriptionSecond(
    GlobalKey<ScaffoldState> scaffoldKey, Item item) {
  var descScreen = FirebaseDatabase.instance.reference().child('Burgers');
  descScreen.child(item.key).once().then((DataSnapshot snapshot) {
    // If user already have item in description
    if (snapshot.value != null) {
      var newDescription =
          Item.fromJson(json.decode(json.encode(snapshot.value)));
      descScreen
          .child(item.key)
          .set(newDescription.toJson())
          .then((value) => ScaffoldMessenger.of(scaffoldKey.currentContext)
              .showSnackBar(SnackBar(content: Text('Update successfully'))))
          .catchError((e) => ScaffoldMessenger.of(scaffoldKey.currentContext)
              .showSnackBar(SnackBar(content: Text('$e'))));
    } else {
      DescriptionsItem description = new DescriptionsItem(
          key: item.key,
          title: item.title,
          price: item.price,
          image: item.image,
          description: item.description,
          sugar: item.sugar,
          fat: item.fat,
          energy: item.energy,
          salt: item.salt,
          energyGramm: item.energyGram,
          sugarGramm: item.sugarGram,
          saltGramm: item.saltGram,
          fatGramm: item.fatGram);
      descScreen
          .child(item.key)
          .set(description.toJson())
          .then((value) => ScaffoldMessenger.of(scaffoldKey.currentContext)
              .showSnackBar(SnackBar(content: Text('fucking work'))))
          .catchError((e) => ScaffoldMessenger.of(scaffoldKey.currentContext)
              .showSnackBar(SnackBar(content: Text('$e'))));
    }
  });
}
