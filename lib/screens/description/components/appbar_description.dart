import 'package:cookie/screens/home/components/favorite_widget.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

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
