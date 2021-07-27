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
              .showSnackBar(SnackBar(content: Text('+ 1 шт.'))))
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

void redirectToDescriptionScreen(
    GlobalKey<ScaffoldState> scaffoldKey, Item item) {
  var soloItem = FirebaseDatabase.instance
      .reference()
      .child('NewCart')
      .child('UNIQUE_USER_ID');
  soloItem.child(item.key).once().then((DataSnapshot snapshot) {
    Cart newItem = new Cart(
        title: item.title,
        image: item.image,
        key: item.key,
        price: item.price,
        totalPrice: double.parse(item.price));
    soloItem
        .child(item.key)
        .set(newItem.toJson())
        .then((value) => ScaffoldMessenger.of(scaffoldKey.currentContext)
            .showSnackBar(
                SnackBar(content: Text('Перешли на страницу с описанием'))))
        .catchError((e) => ScaffoldMessenger.of(scaffoldKey.currentContext)
            .showSnackBar(SnackBar(content: Text('$e'))));
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

void updateItemCardRatingToPancakes(
    GlobalKey<ScaffoldState> scaffoldKey, Item pancakes) {
  var item = FirebaseDatabase.instance.reference().child('Pancakes');
  item.child(pancakes.key).set(pancakes.toJson());
  // .then((value) => ScaffoldMessenger.of(scaffoldKey.currentContext)
  // .showSnackBar(SnackBar(content: Text('Рейтинг обновлен'))))
  // .catchError((e) => ScaffoldMessenger.of(scaffoldKey.currentContext)
  // .showSnackBar(SnackBar(content: Text('$e'))));
}

void updateItemCardRatingToDonuts(
    GlobalKey<ScaffoldState> scaffoldKey, Item pancakes) {
  var item = FirebaseDatabase.instance.reference().child('Donuts');
  item.child(pancakes.key).set(pancakes.toJson())
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

void redirectToDescriptionPancakes(
    GlobalKey<ScaffoldState> scaffoldKey, Item item) {
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
          energyGram: item.energyGram,
          sugarGram: item.sugarGram,
          saltGram: item.saltGram,
          fatGram: item.fatGram);
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

// ! TODO fix to display only one item
void redirectToDescriptionSecond(
    GlobalKey<ScaffoldState> scaffoldKey, Item item) {
  var descScreen = FirebaseDatabase.instance
      .reference()
      .child('DescriptionItem')
      .child('Items');
  descScreen.child(item.key).once().then((DataSnapshot snapshot) {
    // If user already have item in description
    // if (snapshot.value != null) {
    //   var newDescription =
    //       Item.fromJson(json.decode(json.encode(snapshot.value)));
    //   descScreen
    //       .child(item.key)
    //       .set(newDescription.toJson())
    //       .then((value) => ScaffoldMessenger.of(scaffoldKey.currentContext)
    //           .showSnackBar(SnackBar(content: Text('Update successfully'))))
    //       .catchError((e) => ScaffoldMessenger.of(scaffoldKey.currentContext)
    //           .showSnackBar(SnackBar(content: Text('$e'))));
    // }
    if (snapshot.value == null) {
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
          energyGram: item.energyGram,
          sugarGram: item.sugarGram,
          saltGram: item.saltGram,
          fatGram: item.fatGram);
      descScreen
          .child(item.key)
          .set(description.toJson())
          .then((value) => ScaffoldMessenger.of(scaffoldKey.currentContext)
              .showSnackBar(SnackBar(content: Text('fucking work'))))
          .catchError((e) => ScaffoldMessenger.of(scaffoldKey.currentContext)
              .showSnackBar(SnackBar(content: Text('$e'))));
    } else
      return;
  });
}
