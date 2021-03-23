import 'package:cookie/constants.dart';
import 'package:cookie/models/cart.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class FavoriteCard extends StatelessWidget {
  final String id;
  final String sweetId;
  final int totalFavoriteCount;
  final String title;
  final String images;

  const FavoriteCard(
      this.id, this.sweetId, this.totalFavoriteCount, this.title, this.images);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
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
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                  // color: Color(0xFFF5F6F9),
                  color: Colors.white30,
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
              Row(
                children: [
                  Icon(Icons.favorite),
                  Text(
                    '$totalFavoriteCount',
                    style: TextStyle(
                      color: kTextColor,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
