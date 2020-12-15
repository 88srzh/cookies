import 'package:cookie/constants.dart';
import 'package:cookie/models/sweets.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class BodyDetails extends StatelessWidget {
  final Sweets allSweets;

  const BodyDetails({Key key, @required this.allSweets}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SweetsImages(allSweets: allSweets);
  }
}

class SweetsImages extends StatelessWidget {
  const SweetsImages({
    Key key,
    @required this.allSweets,
  }) : super(key: key);

  final Sweets allSweets;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(allSweets.images[0]),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              allSweets.images.length,
              (index) => buildSmallPreview(index),
            )
          ],
        ),
      ],
    );
  }

  Container buildSmallPreview(int index) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(48),
      width: getProportionateScreenWidth(48),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kPrimaryColor),
      ),
      child: Image.asset(allSweets.images[index]),
    );
  }
}
