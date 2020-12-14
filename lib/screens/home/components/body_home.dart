import 'package:cookie/screens/home/components/discount_banner.dart';
import 'package:cookie/screens/home/components/home_header.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class BodyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: getProportionateScreenWidth(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(30)),
            DiscountBanner(),
            BodyHomeScreen(),
          ],
        ),
      ),
    );
  }
}

class BodyHomeScreen extends StatefulWidget {
  BodyHomeScreen({Key key}) : super(key: key);

  @override
  _BodyHomeScreenState createState() => _BodyHomeScreenState();
}

class _BodyHomeScreenState extends State<BodyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Dog',
                  child: Text(
                    '123',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  text: 'Cat',
                ),
                Tab(text: 'Frog'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
