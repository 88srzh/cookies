import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cookie/models/items.dart';
import 'package:cookie/screens/description/components/ingredient_card.dart';
import 'package:cookie/size_config.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

// import 'package:http/http.dart';
// import 'package:provider/provider.dart';

class BodyDescription extends StatelessWidget {
  // final String id;
  BodyDescription();
  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }

  Widget buildDescriptionCard(
      BuildContext context, QueryDocumentSnapshot docs) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]]),
      ),
      child: Column(
        children: [
          SizedBox(
            width: getProportionateScreenWidth(250),
            height: getProportionateScreenHeight(240),
            child: AspectRatio(
              aspectRatio: 1,
              // child: Image.asset(loadedSweet.images),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: getProportionateScreenWidth(40),
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(20),
              bottom: getProportionateScreenWidth(7),
            ),
            /* ingredients */
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
                // IngredientCard(
                //   titleCard: 'Белки',
                //   // ingredients: docs['sugar'],
                //   // gramm: loadedSweet.sugarGramm,
                // ),
                // IngredientCard(
                //   titleCard: 'Жиры',
                //   // ingredients: loadedSweet.salt,
                //   // gramm: loadedSweet.saltGramm,
                // ),
                // IngredientCard(
                //   titleCard: 'Углеводы',
                //   // ingredients: loadedSweet.fat,
                //   // gramm: loadedSweet.fatGramm,
                // ),
                // IngredientCard(
                //   titleCard: 'Энергия',
                //   // ingredients: loadedSweet.energy,
                //   // gramm: loadedSweet.energyGramm,
                // ),
              ],
            ),
          ),
          /* description */
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
                  Flexible(
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: getProportionateScreenWidth(5),
                          left: getProportionateScreenWidth(20),
                          right: getProportionateScreenWidth(20),
                        ),
                        child: Text(
                          '123111111111111111111111111111111111111111111111111111111111111111111111',
                          // docs['description'],
                          // loadedSweet.description,
                          // '123',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
