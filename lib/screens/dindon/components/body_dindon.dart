import 'package:cookie/screens/dindon/components/bottom_add_to_cart.dart';
import 'package:cookie/screens/dindon/components/description_card.dart';
import 'package:cookie/screens/dindon/components/header_dindon.dart';
import 'package:cookie/screens/dindon/components/ingredient_card.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class BodyDindonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenWidth(0)),
          HeaderDindonScreen(),
          SizedBox(
            width: getProportionateScreenWidth(250),
            height: getProportionateScreenHeight(240),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset('assets/images/donut_details.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(20),
              bottom: getProportionateScreenWidth(0),
            ),
            child: Row(
              children: [
                Text(
                  'Ингредиенты',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(
              getProportionateScreenWidth(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IngredientCard(titleCard: 'Сахар'),
                IngredientCard(titleCard: 'Соль'),
                IngredientCard(titleCard: 'Жир'),
                IngredientCard(titleCard: 'Энергия'),
              ],
            ),
          ),
          DescriptionCard(),
          BottomAddToCart(),
        ],
      ),
    );
  }
}
