import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookie/screens/description/components/appbar_description.dart';
import 'package:cookie/screens/description/components/bottom_add_to_cart.dart';
import 'package:cookie/screens/description/components/body_description.dart';
import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  static const routeName = '/description';
  final String id;

  DescriptionScreen({this.id});
  @override
  Widget build(BuildContext context) {
    // CollectionReference items = FirebaseFirestore.instance.collection('Items');
    // Future<void> descriptionScreen() {
    //   return items.doc(id).get().then((DocumentSnapshot docs) {
    //     if (docs.exists) {
    //       print('data: ${docs.data()}');
    //     } else {
    //       print('document does not exist on the database');
    //     }
    //   });
    // }
    

    // ! - выводит все описания
    // body: StreamBuilder(
    //     stream: items.snapshots(),
    //     builder:
    //         (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //       if (snapshot.hasError) {
    //         return Text('Something went wrong');
    //       }

    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Text('Loading...');
    //       }

    //       return new ListView(
    //         children: snapshot.data.docs.map((DocumentSnapshot document) {
    //           return new ListTile(
    //             title: new Text(document.data()['description']),
    //           );
    //         }).toList(),
    //       );
    //     }),
    // window.physicalSize;

    // return FutureBuilder<DocumentSnapshot>(
    //   future: items.doc(id).get(),
    //   builder:
    //       (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    //     if (snapshot.hasError) {
    //       return Text('Something went wrong');
    //     }

    //     if (snapshot.connectionState == ConnectionState.done) {
    //       Map<String, dynamic> data = snapshot.data.data();
    //       return Text('description: ${data['price']}');
    //     }
    //     return Text('loading...');
    //   },
    // );
    // backgroundColor: Color.fromRGBO(248, 219, 221, 1.0),
    // appBar: AppBarDescription(),
    // body: BodyDescription(),
    // bottomNavigationBar: BottomDescription());
  }
}
