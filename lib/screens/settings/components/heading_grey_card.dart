import 'package:flutter/material.dart';

class GreyCard extends StatelessWidget {
  const GreyCard({this.heading});
  final String heading;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0))),
        color: Color.fromRGBO(243, 239, 249, 1),
        // color: Colors.red[50],
        margin: EdgeInsets.all(0),
        child: ListTile(
          title: Text(heading),
        ),
      ),
    );
  }
}
