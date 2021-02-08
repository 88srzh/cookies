import 'package:cookie/models/sweets.dart';
import 'package:cookie/screens/details/components/body_details.dart';
import 'package:cookie/screens/details/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = '/details';
  @override
  Widget build(BuildContext context) {
    final SweetsDetailsArguments arguments =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(arguments.allSweets.rating),
      body: SingleChildScrollView(child: BodyDetails(allSweets: arguments.allSweets)),
    );
  }
}

class SweetsDetailsArguments {
  final Sweets allSweets;

  SweetsDetailsArguments({@required this.allSweets});
}
