import 'package:cookie/models/items.dart';
import 'package:cookie/models/items_info.dart';
import 'package:cookie/screens/description/descriprion_screen.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatefulWidget {
  ItemCard({
    Key key,
  });

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    var item = Provider.of<Items>(context);
    var donut = Provider.of<ItemsInfo>(context);
    // return buildItemCard(context, item, donut)
    return Text('123');
  }
}
