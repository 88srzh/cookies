import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class GreyCard extends StatelessWidget {
  const GreyCard({this.heading});
  final String heading;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Container(
        color: Colors.grey[50],
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //       colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]]),
        // ),
        child: ListTile(
          title: Padding(
            padding: EdgeInsets.only(bottom: getProportionateScreenWidth(6)),
            child: Text(heading, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
        ),
      ),
    );
  }
}
