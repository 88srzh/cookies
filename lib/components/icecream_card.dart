import 'package:cookie/models/ice_cream.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class IceCreamCard extends StatefulWidget {
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
  _IceCreamCardState createState() => _IceCreamCardState();
}

class _IceCreamCardState extends State<IceCreamCard> {
  int popularCount = 41;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: widget.press,
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: widget.aspectRation,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(widget.icecreams.images[0]),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                widget.icecreams.title,
                style: TextStyle(
                  color: Colors.black,
                ),
                maxLines: 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.icecreams.price} p',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                      ),
                    ),
                    Container(
                      // padding: EdgeInsets.only(right: 5),
                      height: 25,
                      width: 10,
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        icon: (widget.icecreams.isPopular
                            ? Icon(Icons.star)
                            : Icon(Icons.star_border)),
                        color: Colors.red[300],
                        onPressed: _togglePopular,
                      ),
                    ),
                    SizedBox(
                      child: Container(
                        child: Text('$popularCount'),
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
                          color: widget.icecreams.isFavourite
                              ? kPrimaryColor.withOpacity(0.15)
                              : kSecondaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset('assets/icons/Heart Icon_2.svg',
                            color: widget.icecreams.isFavourite
                                ? Color(0xFFFF4848)
                                : Color(0xFFDBDEE4)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePopular() {
    setState(() {
      if (widget.icecreams.isPopular) {
        popularCount -= 1;
        widget.icecreams.isPopular = false;
      } else {
        popularCount += 1;
        widget.icecreams.isPopular = true;
      }
    });
  }
}
