import 'dart:io';

import 'package:cookie/screens/dindon/body_dindon_main.dart';
import 'package:cookie/screens/profile/profile_screen.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

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
            // title: Text('Домашняя страница'),

            // ! - third option
            // leading: Icon(
            //   Icons.menu,
            // ),
            // actions: [
            //   Icon(Icons.favorite),
            //   Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 16),
            //     child: Icon(Icons.search),
            //   ),
            //   Icon(Icons.more_vert),
            // ],
            // backgroundColor: Colors.purple,

            // ! - second option
            // actions: [
            //   PopupMenuButton<String>(
            //     onSelected: handleClick,
            //     itemBuilder: (BuildContext context) {
            //       return {'Профиль', 'Настройки', 'Выйти'}.map((String choice) {
            //         return PopupMenuItem<String>(
            //           value: choice,
            //           child: Text(choice),
            //         );s
            //       }).toList();
            //     },
            //   ),
            // ],
            // ! - first option
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(
                  top: getProportionateScreenWidth(10),
                  right: getProportionateScreenWidth(10),
                ),
                child: SizedBox(
                  width: getProportionateScreenWidth(50),
                  height: getProportionateScreenHeight(50),
                  child: Stack(
                    fit: StackFit.expand,
                    overflow: Overflow.visible,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, ProfileScreen.routeName);
                        },
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/avatar_circle2.png'),
                        ),
                      ),
                      // backgroundImage: AssetImage('assets/images/avatar_circle2.png'),
                    ],
                  ),
                ),
              ),
            ],
            bottom: TabBar(
              unselectedLabelColor: Colors.grey,
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

  void handleClick(String value) {
    switch (value) {
      case 'Профиль':
        break;
      case 'Настройки':
        break;
      case 'Выйти':
        break;
    }
  }
}
