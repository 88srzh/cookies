import 'package:cookie/models/sweets.dart';
import 'package:cookie/screens/home/home_screen.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderDindonScreen extends StatefulWidget {
  final Sweets sweets;

  const HeaderDindonScreen({Key key, this.sweets}) : super(key: key);
  @override
  _HeaderDindonScreenState createState() => _HeaderDindonScreenState();
}

class _HeaderDindonScreenState extends State<HeaderDindonScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
          IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(Icons.favorite_outline),
            onPressed: () {},
          ),
          // InkWell(
          //   child: Container(
          //     child: SvgPicture.asset('assets/icons/Heart Icon_2.svg'),
          //     // color: widget.sweets.isFavourite ? Colors.black : Colors.white,
          //     color: Colors.black,
          //   ),
          // ),
        ],
      ),
    );
  }

  // void _tapFavourite() {
  //   setState(() {
  //     if (widget.sweets.isFavourite) {
  //       widget.sweets.isFavourite = false;
  //     } else {
  //       widget.sweets.isFavourite = true;
  //     }
  //   });
  // }
}
