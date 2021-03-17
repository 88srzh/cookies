import 'package:cookie/models/sweets.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cookie/screens/home/components/description_screen.dart';

class DonutCard extends StatefulWidget {
  final String title;
  final String images;
  final double rating;
  final int price;
  final Function press;
  int likes = 0;
  bool isFavourite = false;

  DonutCard({
    Key key,
    this.title,
    this.images,
    this.rating,
    this.price,
    this.press,
    this.likes,
    this.isFavourite,
  });

  @override
  _DonutCardState createState() => _DonutCardState();
}

class _DonutCardState extends State<DonutCard> {
  @override
  Widget build(BuildContext context) {
    var sweet = Provider.of<Sweet>(context);
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(248, 242, 244, 0.5),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(DescriptionScreen.routeName, arguments: sweet.id);
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(241, 240, 246, 2.0),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenWidth(12),
                    ),
                    child: Text(
                      '${widget.price}₽',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: getProportionateScreenWidth(10),
              ),
              child: SizedBox(
                width: getProportionateScreenWidth(100),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(widget.images),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.title}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Данкины',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(15),
                right: getProportionateScreenWidth(15),
                top: getProportionateScreenWidth(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      // tapFavourite();
                    },
                    child: sweet.isFavourite
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_outline),
                  ),
                  Text(
                    '${widget.rating}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void tapFavourite() {
  //   setState(() {
  //     if (widget.isFavourite = true) {
  //       widget.isFavourite = false;
  //     } else {
  //       widget.isFavourite = true;
  //       counter += counter;
  //     }
  // });
  // }
}
