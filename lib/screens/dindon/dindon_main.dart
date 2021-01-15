import 'dart:io';

import 'package:cookie/screens/dindon/body_dindon_main.dart';
import 'package:cookie/screens/profile/profile_screen.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class _Page {
  const _Page({this.icon, this.text});
  final SvgPicture icon;
  final String text;
  // final String assetName = 'assets/icons/donut32.svg';
}

// const List<_Page> _allPages = <_Page>[
//   _Page(icon: SvgPicture.asset(assetName), text: 'Пончики'),
// ];

class DindonMainScreen extends StatefulWidget {
  static String routeName = '/dindon_main';

  @override
  _DindonMainScreenState createState() => _DindonMainScreenState();
}

class _DindonMainScreenState extends State<DindonMainScreen>
    with TickerProviderStateMixin {
  // PageController _pageController = PageController();
  TabController _tabController;

  // double currentPage = 0;
  // int currentTab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelecion);
  }

  void _handleTabSelecion() {
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _pageController.addListener(() {
    //   setState(() {
    //     currentPage = _pageController.page;
    //   });
    // });

    // _tabController.addListener(() {
    //   setState(() {
    //     currentTab = _tabController.index;
    //   });
    // });

    return DefaultTabController(
      length: 4,
      initialIndex: 3,
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
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: 'Пончики',
                  icon: SvgPicture.asset(
                    'assets/icons/donut32.svg',
                    color:
                        _tabController.index == 0 ? Colors.black : Colors.grey,
                  ),
                ),
                Tab(
                  text: 'Бургеры',
                  icon: SvgPicture.asset(
                    'assets/icons/burger_32.svg',
                    color:
                        _tabController.index == 1 ? Colors.black : Colors.grey,
                  ),
                ),
                Tab(
                  text: 'Блинчики',
                  icon: SvgPicture.asset(
                    'assets/icons/puncake2_32.svg',
                    color:
                        _tabController.index == 2 ? Colors.black : Colors.grey,
                  ),
                ),
                Tab(
                  text: 'Пицца',
                  icon: SvgPicture.asset(
                    'assets/icons/pizza_32.svg',
                    color:
                        _tabController.index == 3 ? Colors.black : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Color.fromRGBO(248, 219, 221, 1.0),
          body: TabBarView(
            // controller: _pageController,
            controller: _tabController,
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

  // void handleClick(String value) {
  //   switch (value) {
  //     case 'Профиль':
  //       break;
  //     case 'Настройки':
  //       break;
  //     case 'Выйти':
  //       break;
  //   }
  // }
}
