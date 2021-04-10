// import 'package:cookie/models/cart.dart';
import 'package:cookie/models/favorite.dart';
import 'package:cookie/models/items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  @override
  Widget build(BuildContext context) {
    final sweetId = ModalRoute.of(context).settings.arguments as String;
    final loadedSweet = Provider.of<Sweets>(context).findById(sweetId);
    // final cart = Provider.of<Cart>(context);

    return Row(
      children: [
        SizedBox(
          height: 18,
          width: 18,
          child: Container(
            child: Text('${loadedSweet.totalFavoriteCount}'),
          ),
        ),
        Container(
          child: IconButton(
            icon: (loadedSweet.isFavorite
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_outline)),
            color: Colors.black87,
            onPressed: () {
              _toggleFavorite();
            },
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    final sweetId = ModalRoute.of(context).settings.arguments as String;
    final loadedSweet =
        Provider.of<Sweets>(context, listen: false).findById(sweetId);
    // final cart = Provider.of<Cart>(context, listen: false);
    final favorite = Provider.of<Favorite>(context, listen: false);
    setState(() {
      if (loadedSweet.isFavorite) {
        loadedSweet.favoriteCount -= 1;
        loadedSweet.isFavorite = false;
        loadedSweet.totalFavoriteCount -= 1;
        // cart.removeSingleFavoriteCount(sweetId);
        favorite.removeSingleFavoriteCount(sweetId);
      } else {
        loadedSweet.favoriteCount += 1;
        loadedSweet.isFavorite = true;
        loadedSweet.totalFavoriteCount += loadedSweet.favoriteCount;
        // cart.addFavoriteCount(
        //   sweetId,
        //   loadedSweet.title,
        //   loadedSweet.totalFavoriteCount,
        //   loadedSweet.images,
        // );
        favorite.addFavoriteCount(sweetId, loadedSweet.title,
            loadedSweet.totalFavoriteCount, loadedSweet.images);
      }
    });
  }
}
