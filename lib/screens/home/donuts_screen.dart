import 'dart:convert';

import 'package:cookie/firebase/firebase_action.dart';
import 'package:cookie/models/item.dart';
import 'package:cookie/models/cart.dart';
import 'package:cookie/screens/description/descriprion_screen.dart';
import 'package:cookie/screens/description/new_description_card.dart';
import 'package:cookie/size_config.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DonutsScreen extends StatefulWidget {
  const DonutsScreen({Key key}) : super(key: key);
  static String routeName = '/donutsscreen';

  @override
  _DonutsScreenState createState() => _DonutsScreenState();
}

class _DonutsScreenState extends State<DonutsScreen> {
  GlobalKey<ScaffoldState> _scaffoldKeyDonuts = new GlobalKey();

  List<Item> donuts = new List<Item>.empty(growable: true);
  List<Cart> newCarts = new List<Cart>.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _scaffoldKeyDonuts,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: getProportionateScreenWidth(10),
          left: getProportionateScreenWidth(15),
          right: getProportionateScreenWidth(15),
        ),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseDatabase.instance
                    .reference()
                    .child('Donuts')
                    .onValue,
                builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
                  if (snapshot.hasData) {
                    var map =
                        snapshot.data.snapshot.value as Map<dynamic, dynamic>;
                    donuts.clear();
                    if (map != null) {
                      map.forEach((key, value) {
                        var donut =
                            new Item.fromJson(json.decode(json.encode(value)));
                        donut.key = key;
                        donuts.add(donut);
                      });
                    }
                    return StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        itemCount: donuts.length,
                        padding: EdgeInsets.all(getProportionateScreenWidth(2)),
                        mainAxisSpacing: getProportionateScreenWidth(4),
                        crossAxisSpacing: getProportionateScreenWidth(2),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            child: GestureDetector(
                              onTap: () {
                                // addToCart(_scaffoldKeyDonuts, donuts[index]);
                                // redirectToDescriptionSecond(
                                //     _scaffoldKeyDonuts, donuts[index]);
                                DescriptionScreen(donut: donuts[index]);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color.fromRGBO(248, 219, 221, 1.0),
                                        Colors.orange[100]
                                      ]),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: getProportionateScreenWidth(8)),
                                  child: buildItemCard(index),
                                ),
                              ),
                            ),
                          );
                        },
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.count(1, index.isEven ? 1.1 : 1.0));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItemCard(int index) {
    return Column(
      children: [
        Expanded(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(241, 240, 246, 2.0),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(30))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20),
                        vertical: getProportionateScreenWidth(10)),
                    child: Text('${donuts[index].price}₽',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          // ! - repair text if not image
          flex: 2,
          child: ClipRRect(
            child: Image(
              image: NetworkImage(
                  donuts[index].image == "" ? 'NO IMAGE' : donuts[index].image),
            ),
          ),
        ),
        Flexible(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text('${donuts[index].title}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                ),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text('${donuts[index].categories}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey)),
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: RatingBar.builder(
                      wrapAlignment: WrapAlignment.spaceBetween,
                      itemSize: 20,
                      initialRating: donuts[index].rating,
                      // minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(2)),
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) async {
                        print(rating);
                        donuts[index].rating = rating;
                        print(donuts[index].rating);
                        donuts[index].rating = double.parse(
                            donuts[index].rating.toStringAsFixed(1));
                        updateItemCardRatingToPancakes(
                            _scaffoldKeyDonuts, donuts[index]);
                        setState(() {});
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({donut}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
