import 'package:cookie/components/icecream_card.dart';
import 'package:cookie/cookie_detail.dart';
import 'package:cookie/models/ice_cream.dart';
import 'package:cookie/models/sweets.dart';
import 'package:cookie/screens/details/details_screen.dart';
import 'package:flutter/material.dart';

class BodyCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: MediaQuery.of(context).size.width - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: [
                  ...List.generate(
                    CatalogModel().allSweets.length,
                    (index) => IceCreamCard(
                      icecreams: allIceCream[index],
                      press: () => Navigator.pushNamed(
                        context,
                        DetailsScreen.routeName,
                        arguments: SweetsDetailsArguments(
                          // allSweets: allSweets[index],
                          allSweets: CatalogModel().allSweets[index],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CookieDetail(
                    assetPath: imgPath,
                    cookieprice: price,
                    cookiename: name,
                  )));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isFavorite
                        ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                        : Icon(Icons.favorite_border, color: Color(0xFFEF7532))
                  ],
                ),
              ),
              Hero(
                tag: imgPath,
                child: Container(
                  height: 70.0,
                  // width: 75.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7.0),
              Text(
                price,
                style: TextStyle(
                  color: Color(0xFFCC8053),
                  fontFamily: 'Varela',
                  fontSize: 14.0,
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 14.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  color: Color(0xFFEBEBEB),
                  height: 1.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!added) ...[
                      Icon(
                        Icons.shopping_basket,
                        color: Color(0xFFD17E50),
                        size: 12.0,
                      ),
                      Text(
                        'Добавить в корзину',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          color: Color(0xFFD17E50),
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                    if (added) ...[
                      Icon(
                        Icons.remove_circle_outline,
                        color: Color(0xFFD17E50),
                        size: 12.0,
                      ),
                      Text(
                        '3',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          color: Color(0xFFD17E50),
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                      ),
                      Icon(
                        Icons.add_circle_outline,
                        color: Color(0xFFD17E50),
                        size: 12.0,
                      ),
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
