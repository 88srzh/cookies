import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class CheckCart extends StatefulWidget {
  CheckCart({Key key}) : super(key: key);

  @override
  _CheckCartState createState() => _CheckCartState();
}

class _CheckCartState extends State<CheckCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: getProportionateScreenWidth(100),
      // margin: EdgeInsets.only(
      //   top: getProportionateScreenWidth(20),
      // ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(250, 237, 238, 1.0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: getProportionateScreenWidth(15),
          left: getProportionateScreenWidth(10),
          right: getProportionateScreenWidth(10),
          bottom: getProportionateScreenWidth(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        // text: '\n${widget.widget.allSweets.price}₽\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Итого',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                top: getProportionateScreenWidth(15),
                bottom: getProportionateScreenWidth(15),
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20),
              ),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(40),
              ),
              child: InkWell(
                child: Text(
                  'Проверить',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                onTap: () {
                  // var cart = context.read<Cart>();
                  // cart.add(widget.widget.allSweets);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
