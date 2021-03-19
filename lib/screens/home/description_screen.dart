import 'package:cookie/models/cart.dart';
import 'package:cookie/models/sweets.dart';
import 'package:cookie/screens/home/components/favorite_widget.dart';
import 'package:cookie/screens/home/components/ingredient_card.dart';
import 'package:cookie/screens/home/home_screen.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

class DescriptionScreen extends StatelessWidget {
  static const routeName = '/dindondetails';
  @override
  Widget build(BuildContext context) {
    final sweetId = ModalRoute.of(context).settings.arguments as String;
    final loadedSweet = Provider.of<Sweets>(context).findById(sweetId);
    final cart = Provider.of<Cart>(context);
    final messenger = ScaffoldMessenger.of(context);
    window.physicalSize;
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 219, 221, 1.0),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // stops: [0.3, 1.5],
              colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]],
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenWidth(0)),
              /* HEADER */
              Padding(
                padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(0),
                  right: getProportionateScreenWidth(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      },
                    ),
                    Row(
                      children: [
                        FavoriteWidget(),
                      ],
                    ),
                    // ! change
                  ],
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(250),
                height: getProportionateScreenHeight(240),
                child: AspectRatio(
                  aspectRatio: 1,
                  // child: Image.asset(widget.allSweets.images),
                  child: Image.asset(loadedSweet.images),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getProportionateScreenWidth(40),
                  left: getProportionateScreenWidth(20),
                  right: getProportionateScreenWidth(20),
                  bottom: getProportionateScreenWidth(7),
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
                      titleCard: 'Белки',
                      ingredients: loadedSweet.sugar,
                      gramm: loadedSweet.sugarGramm,
                    ),
                    IngredientCard(
                      titleCard: 'Жиры',
                      ingredients: loadedSweet.salt,
                      gramm: loadedSweet.saltGramm,
                    ),
                    IngredientCard(
                      titleCard: 'Углеводы',
                      ingredients: loadedSweet.fat,
                      gramm: loadedSweet.fatGramm,
                    ),
                    IngredientCard(
                      titleCard: 'Энергия',
                      ingredients: loadedSweet.energy,
                      gramm: loadedSweet.energyGramm,
                    ),
                  ],
                ),
              ),
              // DescriptionCard(),
              // ! descriptionCard
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: getProportionateScreenHeight(10),
                          left: getProportionateScreenWidth(20),
                          right: getProportionateScreenWidth(20),
                        ),
                        child: Text(
                          'Описание',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: getProportionateScreenWidth(5),
                            left: getProportionateScreenWidth(20),
                            right: getProportionateScreenWidth(20),
                          ),
                          child: Text(
                            loadedSweet.description,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // ! bottom_add_to_cart
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(
                  top: getProportionateScreenWidth(20),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(250, 237, 238, 1.0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: getProportionateScreenWidth(15),
                    left: getProportionateScreenWidth(10),
                    right: getProportionateScreenWidth(10),
                    bottom: getProportionateScreenWidth(16.4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '\n${loadedSweet.price}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  // ! Добавить totalPrice
                                  text: 'Итого',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: getProportionateScreenWidth(15),
                          bottom: getProportionateScreenWidth(15),
                          left: getProportionateScreenWidth(20),
                          right: getProportionateScreenWidth(20),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: InkWell(
                          child: Text(
                            'Добавить в корзину',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          onTap: () {
                            cart.addItem(
                              sweetId,
                              loadedSweet.title,
                              loadedSweet.price,
                              loadedSweet.images,
                            );
                            messenger.showSnackBar(SnackBar(
                              content: Text('Товар добавлен в корзину'),
                            ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AllSweetsDetailsArguments {
  final Sweets allSweets;

  AllSweetsDetailsArguments({@required this.allSweets});
}
