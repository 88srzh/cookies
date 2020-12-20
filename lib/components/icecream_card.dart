import 'package:cookie/models/ice_cream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class IceCreamCard extends StatelessWidget {
  const IceCreamCard({
    Key key,
    this.width = 140,
    this.aspectRation = 1.02,
    @required this.icecreams,
    @required this.press,
  }) : super(key: key);

  final double width, aspectRation;
  final IceCream icecreams;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: aspectRation,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(icecreams.images[0]),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                icecreams.title,
                style: TextStyle(
                  color: Colors.black,
                ),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${icecreams.price} p',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: icecreams.isFavourite
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset('assets/icons/Heart Icon_2.svg',
                          color: icecreams.isFavourite
                              ? Color(0xFFFF4848)
                              : Color(0xFFDBDEE4)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
