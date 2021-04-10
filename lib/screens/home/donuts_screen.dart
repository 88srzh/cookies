import 'package:cookie/components/default_button_grey.dart';
import 'package:cookie/models/items.dart';
import 'package:cookie/models/items_info.dart';
import 'package:cookie/screens/home/components/item_card.dart';
import 'package:cookie/size_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonutsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sweetData = Provider.of<Sweets>(context);
    final sweets = sweetData.allSweets;
    final donutsData = Provider.of<ItemsInfo>(context);
    final donuts = donutsData.itemsInfo;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // stops: [0.3, 1.8],
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
              // child: GridView.builder(
              //   physics: ScrollPhysics(),
              //   shrinkWrap: true,
              //   itemCount: sweets.length,
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2),
              //   itemBuilder: (context, index) => ChangeNotifierProvider.value(
              //     value: sweets[index],
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: DonutCard(
              //         title: sweets[index].title,
              //         rating: sweets[index].rating,
              //         price: sweets[index].price,
              //         images: sweets[index].images,
              //       ),
              //     ),
              //   ),
              // ),
              // ---------------------------------------------
              // child: GridView.count(
              //   shrinkWrap: true,
              //   mainAxisSpacing: 15.0,
              //   crossAxisSpacing: 20.0,
              //   crossAxisCount: 2,
              //   childAspectRatio:
              //       (SizeConfig.itemWidth / SizeConfig.itemHeight),
              //   children: [
              //     ...List.generate(sweets.length, (index) {
              //       return ChangeNotifierProvider.value(
              //         value: sweets[index],
              //         child: ItemCard(),
              //       );
              //       // return SizedBox.shrink();
              //     }),
              //   ],
              // ),
              // -----------------------------------------------------
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('Items').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const Text('Loading...');
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) =>
                          buildListItem(context, snapshot.data.docs[index]));
                  // -----------------------------------------------------
                  // return GridView.count(
                  //   crossAxisCount: 2,
                  //   shrinkWrap: true,
                  //   mainAxisSpacing: 15.0,
                  //   crossAxisSpacing: 20.0,
                  //   childAspectRatio:
                  //       (SizeConfig.itemWidth / SizeConfig.itemHeight),
                  //   children: [
                  //     ...List.generate(snapshot.data.documents.length, (index) {
                  //       return ChangeNotifierProvider.value(
                  //         value: snapshot.data.documents[index],
                  //         child: ItemCard(),
                  //       );
                  //     })
                  //   ],
                  // );
                },
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   // crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     DefaultButtonGrey(
            //       text: 'Показать еще',
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildListItem(BuildContext context, DocumentSnapshot docs) {
    return ListTile(
      title: Row(children: [
        Expanded(
          child: Text(
            docs['title'],
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color(0xffddddff),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Text(
            docs['price'].toString(),
          ),
        ),
      ]),
    );
  }
}
