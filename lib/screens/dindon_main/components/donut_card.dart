import 'package:cookie/models/sweets.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class DonutCard extends StatefulWidget {
  const DonutCard({
    Key key,
    @required this.sweets,
    @required this.press,
  }) : super(key: key);

  final Sweets sweets;
  final GestureTapCallback press;

  @override
  _DonutCardState createState() => _DonutCardState();
}

class _DonutCardState extends State<DonutCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(248, 242, 244, 0.5),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
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
                    '${widget.sweets.price}₽',
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
                child: Image.asset(
                  widget.sweets.images[0],
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${widget.sweets.title}',
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
                    // _tapFavourite();
                  },
                  child: Icon(Icons.favorite_outline),
                  // child: widget.sweets.isFavourite
                  //     ? Icon(Icons.favorite_outline)
                  //     : Icon(Icons.favorite),
                ),
                Text(
                  '${widget.sweets.rating}',
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
    );
  }
}
