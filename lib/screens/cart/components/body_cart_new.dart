import 'package:cookie/models/sweets.dart';
import 'package:flutter/material.dart';

class BodyCartNew extends StatefulWidget {
  @override
  _BodyCartNewState createState() => _BodyCartNewState();
}

class _BodyCartNewState extends State<BodyCartNew> {
  final List<Sweets> sweetsList = [];

  void newSweets(String sweetPost) {
    this.setState(() {
      sweetsList.add(new Sweets(1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SweetsList(this.sweetsList),
          SweetInputWidget(this.newSweets),
        ],
      ),
    );
  }
}

class SweetInputWidget extends StatefulWidget {
  final Function(String) callback;

  SweetInputWidget(this.callback);

  @override
  _SweetInputWidgetState createState() => _SweetInputWidgetState();
}

class _SweetInputWidgetState extends State<SweetInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SweetsList extends StatefulWidget {
  final List<Sweets> listSweets;

  SweetsList(this.listSweets);

  @override
  _SweetsListState createState() => _SweetsListState();
}

class _SweetsListState extends State<SweetsList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
