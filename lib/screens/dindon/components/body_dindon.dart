import 'package:cookie/models/Cart.dart';
import 'package:cookie/models/sweets.dart';
import 'package:cookie/screens/dindon/components/bottom_add_to_cart.dart';
import 'package:cookie/screens/dindon/components/description_card.dart';
import 'package:cookie/screens/dindon/components/header_dindon.dart';
import 'package:cookie/screens/dindon/components/ingredient_card.dart';
import 'package:cookie/screens/dindon/dindon_main.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class BodyDindonScreen extends StatefulWidget {
  final Sweets allSweets;

  const BodyDindonScreen({Key key, @required this.allSweets}) : super(key: key);

  @override
  _BodyDindonScreenState createState() => _BodyDindonScreenState();
}

class _BodyDindonScreenState extends State<BodyDindonScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenWidth(0)),
          // HeaderDindonScreen(),
          Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(0),
              right: getProportionateScreenWidth(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Icon(Icons.arrow_back),
                IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushNamed(context, DindonMainScreen.routeName);
                  },
                ),
                // ! change
                IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(250),
            height: getProportionateScreenHeight(240),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(widget.allSweets.images[0]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: getProportionateScreenWidth(20),
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
                IngredientCard(
                  titleCard: 'Сахар',
                  ingredients: widget.allSweets.sugar,
                  gramm: widget.allSweets.sugarGramm,
                ),
                IngredientCard(
                  titleCard: 'Соль',
                  ingredients: widget.allSweets.salt,
                  gramm: widget.allSweets.saltGramm,
                ),
                IngredientCard(
                  titleCard: 'Жир',
                  ingredients: widget.allSweets.fat,
                  gramm: widget.allSweets.fatGramm,
                ),
                IngredientCard(
                  titleCard: 'Энергия',
                  ingredients: widget.allSweets.energy,
                  gramm: widget.allSweets.energyGramm,
                ),
              ],
            ),
          ),
          DescriptionCard(),
          // BottomAddToCart(),
          BottomAddToCart(widget: widget),
        ],
      ),
    );
  }

  void cartToast() {
    Fluttertoast.showToast(
      msg: 'Товар добавлен',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blueAccent,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
