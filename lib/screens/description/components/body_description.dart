import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cookie/models/items.dart';
import 'package:cookie/screens/description/components/ingredient_card.dart';
import 'package:cookie/size_config.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

// import 'package:http/http.dart';
// import 'package:provider/provider.dart';

class BodyDescription extends StatelessWidget {
  final String id;
  BodyDescription({this.id});
  @override
  Widget build(BuildContext context) {
    // final itemId = ModalRoute.of(context).settings.arguments as String;
    // final loadedSweet = Provider.of<Sweets>(context).findById(itemId);
    // final loadedBurger = Provider.of<Sweets>(context).findByIdBurgers(itemId);
    // ---------------------------------------------------------------------
    // return StreamBuilder(
    //     stream: FirebaseFirestore.instance.collection('Items').snapshots(),
    //     builder: (context, snapshot) {
    //       if (!snapshot.hasData) return Text('Loading...');
    //       return ListView.builder(
    //           itemCount: snapshot.data.docs.length,
    //           itemBuilder: (context, index) {
    //             return buildDescriptionCard(context, snapshot.data.docs[index]);
    //           });
    // });
    // QuerySnapshot ref =
    // FirebaseFirestore.instance.collection('Items').snapshots();
    // DocumentSnapshot nextSnap = await transaction.get(docs.reference);
    // return buildDescriptionCard(context, nextSnap);
    // CollectionReference ref = FirebaseFirestore.instance.collection('Items');
    // final donutItem = ModalRoute.of(context).settings.arguments as String;
    // return StreamBuilder(
    //     stream: FirebaseFirestore.instance.collection('Items').snapshots(),
    //     builder: (context, snapshot) {
    //       if (!snapshot.hasData) return Text('Loading...');
    //       return buildDescriptionCard(context, snapshot.data.docs);
    //     });

    CollectionReference items = FirebaseFirestore.instance.collection('Items');

    return FutureBuilder<DocumentSnapshot>(
      future: items.doc(id).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text('description: ${data['description']}');
        }
        return Text('loading...');
      },
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
                          '123',
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
