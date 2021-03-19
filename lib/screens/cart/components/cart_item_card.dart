import 'package:cookie/models/cart.dart';
// import 'package:cookie/screens/details/components/sweets_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CartSweet extends StatelessWidget {
  final String id;
  final String sweetId;
  final int price;
  final int quantity;
  final String title;
  final String images;

  CartSweet(this.id, this.sweetId, this.price, this.quantity, this.title,
      this.images);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Color(0xFFFFE6E6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Spacer(),
            SvgPicture.asset('assets/icons/Trash.svg'),
          ],
        ),
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeSweet(sweetId);
      },
      // ! - cart_item_card
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(images),
              ),
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$title',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: '${price}p ',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                  children: [
                    TextSpan(
                      text: 'x$quantity',
                      style: TextStyle(color: kTextColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
