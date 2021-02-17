import 'package:cookie/models/cart_new.dart';
import 'package:cookie/models/sweets.dart';
// import 'package:cookie/screens/dindon/components/body_dindon.dart';
import 'package:cookie/screens/dindon/components/ingredient_card.dart';
import 'package:cookie/screens/dindon/dindon_main.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DindonScreen extends StatelessWidget {
  static String routeName = '/dindondetails';
  @override
  Widget build(BuildContext context) {
    final sweetId = ModalRoute.of(context).settings.arguments as String;
    final loadedSweet = Provider.of<Sweets>(context).findById(sweetId);
    final cart = Provider.of<Cart>(context);
    // final AllSweetsDetailsArguments allarguments =
    //     ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 219, 221, 1.0),
      body: SingleChildScrollView(
        // child: BodyDindonScreen(allSweets: allarguments.allSweets)),
        // child: BodyDindonScreen(),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                // stops: [0.3, 1.5],
                colors: [
                  Color.fromRGBO(248, 219, 221, 1.0),
                  Colors.orange[100]
                ],
              ),
            ),
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
                          Navigator.pushNamed(
                              context, DindonMainScreen.routeName);
                        },
                      ),
                      // ! change
                      IconButton(
                        icon: Icon(Icons.favorite_outline),
                        onPressed: () {},
                        // color: widget.allSweets.isFavourite
                        // ? Color(0xFFFFE6E6)
                        // : Color(0xFFF5F6F9),
                      ),
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
                        // ingredients: widget.allSweets.sugar,
                        ingredients: loadedSweet.sugar,
                        // gramm: widget.allSweets.sugarGramm,
                        gramm: loadedSweet.sugarGramm,
                      ),
                      IngredientCard(
                        titleCard: 'Жиры',
                        // ingredients: widget.allSweets.salt,
                        ingredients: loadedSweet.salt,
                        // gramm: widget.allSweets.saltGramm,
                      ),
                      IngredientCard(
                        titleCard: 'Углеводы',
                        // ingredients: widget.allSweets.fat,
                        ingredients: loadedSweet.fat,
                        // gramm: widget.allSweets.fatGramm,
                        gramm: loadedSweet.fatGramm,
                      ),
                      IngredientCard(
                        titleCard: 'Энергия',
                        // ingredients: widget.allSweets.energy,
                        ingredients: loadedSweet.energy,
                        // gramm: widget.allSweets.energyGramm,
                        gramm: loadedSweet.energyGramm,
                      ),
                    ],
                  ),
                ),
                // DescriptionCard(),
                // DescriptionCard(widget: widget),

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
                        Padding(
                          padding: EdgeInsets.only(
                            top: getProportionateScreenWidth(5),
                            left: getProportionateScreenWidth(20),
                            right: getProportionateScreenWidth(20),
                          ),
                          child: Text(
                            // widget.allSweets.description,
                            loadedSweet.description,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // BottomAddToCart(widget: widget),

                // ! bottom_add_to_cart
                Container(
                  alignment: Alignment.bottomCenter,
                  height: getProportionateScreenWidth(100),
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
                      bottom: getProportionateScreenWidth(5),
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
                                    // text: '\n${widget.widget.allSweets.price}₽\n',
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
                              // cartToast();
                              // var cart = context.read<Cart>();
                              // cart.add();
                              cart.addItem(sweetId, loadedSweet.title,
                                  loadedSweet.price);
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
      ),
    );
  }
}

class AllSweetsDetailsArguments {
  final Sweets allSweets;

  AllSweetsDetailsArguments({@required this.allSweets});
}
