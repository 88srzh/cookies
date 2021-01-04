import 'package:cookie/components/rounded_icon_btn.dart';
import 'package:cookie/models/Cart.dart';
import 'package:cookie/models/sweets.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:provider/provider.dart';

class ColorDots extends StatefulWidget {
  const ColorDots({
    Key key,
    this.allSweets,
  }) : super(key: key);

  final Sweets allSweets;

  @override
  _ColorDotsState createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
  @override
  Widget build(BuildContext context) {
    int selectedColor = 3;
    var cart = context.watch<Cart>();
    // var cart = context.select((value) => Cart());
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
            widget.allSweets.colors.length,
            (index) => ColorDot(
              color: widget.allSweets.colors[index],
              isSelected: selectedColor == index,
            ),
          ),
          Spacer(),
          Text('${cart.counter}'),
          RoundedIconBtn(
              iconData: Icons.remove,
              press: () {
                cart.decrementCounter();
              }),
          SizedBox(width: getProportionateScreenWidth(15)),
          RoundedIconBtn(
              iconData: Icons.add,
              press: () {
                cart.incrementCounter();
              }),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key key,
    @required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(8),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        // color: allSweets.colors[0],
        shape: BoxShape.circle,
        border:
            Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
