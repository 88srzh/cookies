import 'package:cookie/models/sweets.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cookie/models/cart.dart';
import 'package:cookie/screens/dindon/components/dindon_screen.dart';

class DonutCard extends StatelessWidget {
  final String title;
  final String images;
  final double rating;
  final int price;
  final Function press;

  DonutCard(
      {Key key, this.title, this.images, this.rating, this.price, this.press});
  // const DonutCard({
  //   Key key,
  //   this.sweets,
  //   this.press,
  // }) : super(key: key);

  // final Sweets sweets;
  //
  @override
  Widget build(BuildContext context) {
    final sweet = Provider.of<Sweet>(context);
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
              .pushNamed(DindonScreen.routeName, arguments: sweet.id);
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
                      '$price₽',
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
                  child: Image.asset(images),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  // '${widget.sweets.title}',
                  '$title',
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
                      tapFavourite();
                    },
                    // child: Icon(Icons.favorite_outline),
                    // child: widget.sweets.isFavourite
                    child: sweet.isFavourite
                        ? Icon(Icons.favorite_outline)
                        : Icon(Icons.favorite),
                  ),
                  Text(
                    // '${widget.sweets.rating}',
                    '$rating',
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

// ! - add tap to favourite
  void tapFavourite() {
    // setState(() {
    //   if (widget.sweets.isFavourite) {
    //     widget.sweets.isFavourite = false;
    //   } else {
    //     widget.sweets.isFavourite = true;
    //   }
    // });
  }
}
