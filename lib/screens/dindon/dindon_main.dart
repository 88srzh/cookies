import 'package:cookie/screens/dindon/components/body_dindon_main.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DindonMainScreen extends StatelessWidget {
  static String routeName = '/dindon_main';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          drawer: Drawer(),
          appBar: AppBar(
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            }),
            bottom: TabBar(
              // indicatorPadding: EdgeInsets.only(
              //   top: getProportionateScreenWidth(10),
              // ),
              // unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: 'Пончики',
                  icon: SvgPicture.asset('assets/icons/donut32.svg'),
                ),
                Tab(
                  text: 'Бургеры',
                  icon: SvgPicture.asset('assets/icons/burger_32.svg'),
                ),
                Tab(
                  text: 'Блинчики',
                  icon: SvgPicture.asset('assets/icons/puncake2_32.svg'),
                ),
                Tab(
                  text: 'Пицца',
                  icon: SvgPicture.asset('assets/icons/pizza_32.svg'),
                ),
              ],
            ),
          ),
          backgroundColor: Color.fromRGBO(248, 219, 221, 1.0),
          body: TabBarView(
            children: [
              BodyDindonMainScreen(),
              Icon(Icons.directions_car),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
