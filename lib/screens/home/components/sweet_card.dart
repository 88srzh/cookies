import 'package:cookie/models/sweets.dart';
import 'package:cookie/screens/description/descriprion_screen.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SweetCard extends StatefulWidget {
  // final String title;
  // final String images;
  // final String categories;
  // final double rating;
  // final int price;
  // final Function press;
  // int likes = 0;
  // bool isFavourite;

  SweetCard({
    Key key,
    // this.title,
    // this.images,
    // this.categories,
    // this.rating,
    // this.price,
    // this.press,
    // this.likes,
    // this.isFavourite,
  });

  @override
  _SweetCardState createState() => _SweetCardState();
}

class _SweetCardState extends State<SweetCard> {
  @override
  Widget build(BuildContext context) {
    var sweet = Provider.of<Sweet>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // stops: [0.3, 1.8],
          colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]],
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(DescriptionScreen.routeName, arguments: sweet.id);
        },
        child: Column(
          children: [
            Flexible(
              child: Container(
                child: Row(
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
                          '${sweet.price}₽',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: getProportionateScreenWidth(10),
                ),
                child: SizedBox(
                  width: getProportionateScreenWidth(100),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(sweet.images),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${sweet.title}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '${sweet.categories}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(15),
                    right: getProportionateScreenWidth(15),
                    top: getProportionateScreenWidth(15),
                  ),
                  child: Flexible(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              // tapFavourite();
                            },
                            child: sweet.isFavorite
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_outline),
                          ),
                          Text(
                            '${sweet.rating}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
