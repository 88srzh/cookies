import 'package:cookie/components/custom_box_shadow.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  final String titleCard, ingredients, gramm;

  IngredientCard({@required this.titleCard, this.ingredients, this.gramm});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(75),
      height: getProportionateScreenHeight(140),
      padding: EdgeInsets.only(
        top: getProportionateScreenWidth(10),
        left: getProportionateScreenWidth(5),
        right: getProportionateScreenWidth(5),
        bottom: getProportionateScreenWidth(4),
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(250, 237, 238, 0.6),
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          CustomBoxShadow(
            color: Colors.black26,
            offset: Offset(1.0, 1.0),
            blurRadius: 1.0,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            titleCard,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '$gramm',
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(80),
              ),
              child: Text(
                '$ingredients%',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              width: getProportionateScreenWidth(42),
              height: getProportionateScreenHeight(50),
            ),
          ),
        ],
      ),
    );
  }
}
