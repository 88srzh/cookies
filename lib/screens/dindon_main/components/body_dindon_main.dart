import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class BodyDindonMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    // final double itemWidth = size.width / 2;
    return Padding(
      padding: EdgeInsets.only(
        top: getProportionateScreenWidth(10),
        left: getProportionateScreenWidth(15),
        right: getProportionateScreenWidth(15),
      ),
      child: Column(
        children: [
          Expanded(
            child: GridView.count(
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 20.0,
              crossAxisCount: 2,
              // childAspectRatio: (itemWidth / itemHeight),
              childAspectRatio: (SizeConfig.itemWidth / SizeConfig.itemHeight),
              children: List.generate(
                4,
                (index) => Container(
                  child: Container(
                    // constraints: BoxConstraints(
                    //   maxHeight: MediaQuery.of(context).size.height / 2,
                    // ),
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
                                color: Colors.white,
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
                                  '65₽',
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
                                  'assets/images/donut_pink_resize.png'),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Красный Вельвет',
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
                              Icon(Icons.favorite_outline),
                              Text(
                                '3.8',
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
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(10),
                      horizontal: getProportionateScreenWidth(20),
                    ),
                    child: Text(
                      'Показать еще',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
