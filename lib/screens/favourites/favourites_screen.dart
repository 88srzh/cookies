import 'package:cookie/models/sweets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatefulWidget {
  static const routeName = '/favourites';

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  List<Favourites> _favourites;
  @override
  void initState() {
    super.initState();
    _favourites = [];
  }

  @override
  Widget build(BuildContext context) {
    var sweet = Provider.of<Sweet>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(child: Text('Любимые')),
          Expanded(
            child: ListView.builder(
                itemCount: _favourites.length,
                itemBuilder: (_, index) {
                  return ListTile(title: Text(_favourites[0]));
                }),
          ),
        ],
      ),
    );
  }
}
