import 'package:cookie/models/items.dart';
import 'package:cookie/screens/description/descriprion_screen.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatefulWidget {
  ItemCard({
    Key key,
  });

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    var item = Provider.of<Items>(context);
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
              .pushNamed(DescriptionScreen.routeName, arguments: item.id);
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
                          '${item.price}₽',
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
            Flexible(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: getProportionateScreenWidth(10),
                  ),
                  child: SizedBox(
                    width: getProportionateScreenWidth(100),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(item.images),
                    ),
                  ),
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
                      child: Text(
                        '${item.title}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        '${item.categories}',
                        style: TextStyle(
                          // fontSize: 12,
                          color: Colors.grey,
                        ),
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
                            child: item.isFavorite
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_outline),
                          ),
                          Text(
                            '${item.rating}',
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
