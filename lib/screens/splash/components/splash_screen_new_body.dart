import 'package:cookie/constants.dart';
import 'package:cookie/screens/splash/components/splash_content_new.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreenNewBody extends StatefulWidget {
  @override
  _SplashScreenNewBodyState createState() => _SplashScreenNewBodyState();
}

class _SplashScreenNewBodyState extends State<SplashScreenNewBody> {
  int _currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      'headingText': 'Попробуйте',
      'middleText': 'Попробуйте наши сладости',
      'bottomText': ''
    },
    {
      'headingText': 'Сделано с любовью',
      'middleText': 'Наша еда сделана исключительно',
      'bottomText': 'любящими ручками',
    },
    {
      'headingText': 'Лучшие продукты',
      'middleText': 'Для изготовления используются',
      'bottomText': 'только лучшие продукты'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage('assets/images/background-splash-screen-second.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                          child: Image(
                            image: AssetImage('assets/images/splah-screen-logo.png'),
                          ),
                          // child: Text('LOGO', style: TextStyle(color: Colors.white),)
                    )),
                  SizedBox(height: getProportionateScreenWidth(100)),
                  Expanded(
                      child: PageView.builder(
                        onPageChanged: (value) {
                          setState(() {
                            _currentPage = value;
                          });
                        },
                        itemCount: splashData.length,
                        itemBuilder: (context, index) => SplashContentNew(
                          headingText: splashData[index]['headingText'],
                          middleText: splashData[index]['middleText'],
                          bottomText: splashData[index]['bottomText'],
                          ),
                      ),
                  ),
                  Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                            List.generate(
                                splashData.length,
                                    (index) => buildDotNew(index: index),
                            ),
                        ),
                      ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(4)),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(getProportionateScreenWidth(8)),
                                              side: BorderSide(color: Colors.redAccent),
                                            )
                                        )
                                    ),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(14)),
                                      child: Text('Присоединиться', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                                )),
                          )),
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(4)),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(getProportionateScreenWidth(8)),
                                        side: BorderSide(color: Colors.white),
                                      )
                                    )
                                  ),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(14)),
                                      child: Text('Войти', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
                                )),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    ],
        ),
    );
  }

  AnimatedContainer buildDotNew({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5.0),
      height: 6,
      width: _currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.white : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
