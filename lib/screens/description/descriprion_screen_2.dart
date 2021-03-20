import 'dart:ui';

import 'package:cookie/models/cart.dart';
import 'package:cookie/models/sweets.dart';
import 'package:cookie/screens/cart/components/body_cart.dart';
import 'package:cookie/screens/cart/components/bottom_cart.dart';
import 'package:cookie/screens/description/components/bottom_add_to_cart.dart';
import 'package:cookie/screens/home/components/body_description.dart';
import 'package:cookie/screens/home/components/favorite_widget.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DescriptionScreen2 extends StatelessWidget {
  final Cart cart;
  static const routeName = '/description2';
  const DescriptionScreen2({this.cart});
  @override
  Widget build(BuildContext context) {
    // final sweetId = ModalRoute.of(context).settings.arguments as String;
    // final loadedSweet = Provider.of<Sweets>(context).findById(sweetId);
    // final cart = Provider.of<Cart>(context);
    // final messenger = ScaffoldMessenger.of(context);
    window.physicalSize;
    return Scaffold(
        backgroundColor: Color.fromRGBO(248, 219, 221, 1.0),
        appBar: AppBarDescription(),
        body: BodyDescription(),
        bottomNavigationBar: BottomDescription());
  }
}

class AppBarDescription extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: getProportionateScreenWidth(0),
          ),
          FavoriteWidget(),
        ],
      ),
    );
  }
}
