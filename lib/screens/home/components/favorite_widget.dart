import 'package:cookie/models/sweets.dart';
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

    return Row(
      children: [
        SizedBox(
          width: 18,
          child: Container(
            child: Text('${loadedSweet.favoriteCount}'),
          ),
        ),
        Container(
          child: IconButton(
            icon: (loadedSweet.isFavorite
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_outline)),
            color: Colors.black87,
            onPressed: () {
              // loadedSweet.likeSweets();
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
    setState(() {
      if (loadedSweet.isFavorite) {
        loadedSweet.favoriteCount -= 1;
        loadedSweet.isFavorite = false;
        loadedSweet.totalFavoriteCount -= loadedSweet.favoriteCount;
      } else {
        loadedSweet.favoriteCount += 1;
        loadedSweet.isFavorite = true;
        loadedSweet.totalFavoriteCount += loadedSweet.favoriteCount;
      }
    });
  }
}
