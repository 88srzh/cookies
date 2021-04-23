import 'package:cookie/models/item.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
    @required this.donuts,
    @required this.index,
  }) : super(key: key);

  final List<Item> donuts;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      '${donuts[index].price}₽',
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
        Expanded(
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
                  child: Text(
                    '${donuts[index].title}',
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
                    '${donuts[index].categories}',
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
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        // tapFavourite();
                      },
                      // child: item.isFavorite
                      //     ? Icon(Icons.favorite)
                      //     : Icon(Icons.favorite_outline),
                      child: Icon(Icons.favorite_outline),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        '${donuts[index].rating}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
