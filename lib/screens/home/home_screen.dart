import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:cookie/components/custom_list_tile.dart';
import 'package:cookie/controller/user_controller.dart';
import 'package:cookie/locator.dart';
import 'package:cookie/models/cart.dart';
import 'package:cookie/screens/auth_test_screen.dart';
import 'package:cookie/screens/home/donuts_screen.dart';
import 'package:cookie/screens/home/pizza_screen.dart';
import 'package:cookie/screens/profile/profile_screen.dart';
import 'package:cookie/screens/settings/settings_screen.dart';
import 'package:cookie/screens/sign_in/sign_in_screen.dart';
import 'package:cookie/size_config.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cookie/screens/home/burgers_screen.dart';
import 'package:cookie/screens/home/pancakes_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/dindon_main';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController _tabController;
  List<Cart> newCarts = new List<Cart>.empty(growable: true);
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
    // final user = FirebaseAuth.instance.currentUser;
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
          drawer: Drawer(
            child: ListView(
              children: [
                CustomListTile(
                  icon: Icon(Icons.person_add),
                  title: 'Профиль',
                  onPressed: () => Navigator.pushNamed(context, ProfileScreen.routeName),
                ),
                // CustomListTile(
                //   icon: Icon(FontAwesomeIcons.solidHeart),
                //   title: 'Любимое',
                //   onPressed: () =>
                // Navigator.pushNamed(context, FavoriteScreen.routeName),
                // ),
                CustomListTile(
                  icon: Icon(Icons.settings),
                  title: 'Настройки',
                  onPressed: () => Navigator.pushNamed(context, SettingsScreen.routeName),
                ),
                CustomListTile(
                  icon: Icon(Icons.supervised_user_circle_outlined),
                  title: 'ТестПользователей',
                  onPressed: () => Navigator.pushNamed(context, TestAuthScreen.routeName),
                ),
                // CustomListTile(
                //   icon: Icon(Icons.add_shopping_cart),
                //   title: 'Корзина',
                //   onPressed: () =>
                //       Navigator.pushNamed(context, CartScreen.routeName),
                // ),
                CustomListTile(
                    icon: Icon(Icons.exit_to_app),
                    title: 'Выйти',
                    onPressed: () async {
                      var userController = locator.get<UserController>();
                      userController.signOut();
                      // context.read<AuthentificationService>().signOut();
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    }),
                // ! - Add screen logout google
                CustomListTile(
                  icon: Icon(Icons.exit_to_app),
                  title: 'Выйти из Google',
                  onPressed: () {},
                  // onPressed: () => Navigator.pushNamed(context, GoogleLogoutPage.routeName),
                ),
                // CustomListTile(
                //   icon: Icon(Icons.agriculture_outlined),
                //   title: 'DescriptionPage',
                //   onPressed: () => Navigator.of(context).pushNamed('/descriptionPage'),
                // ),
              ],
            ),
          ),
          appBar: AppBar(
            title: Text('Главная страница'),

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
            //         );
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
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
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
                  width: getProportionateScreenWidth(60),
                  height: getProportionateScreenHeight(60),
                  child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: [
                      StreamBuilder(
                        stream: FirebaseDatabase.instance.reference().child('NewCart').child('UNIQUE_USER_ID').onValue, // use FirebaseAuth uid
                        builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
                          var numberItemInCart = 0;
                          if (snapshot.hasData) {
                            Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
                            newCarts.clear();
                            if (map != null) {
                              map.forEach((key, value) {
                                var newCart = Cart.fromJson(json.decode(json.encode(value)));
                                newCart.key = key;
                                newCarts.add(newCart);
                              });
                              // Calculate number
                              numberItemInCart = newCarts.map<int>((m) => m.quantity).reduce((s1, s2) => s1 + s2);
                            }
                            return GestureDetector(
                              onTap: () {
                                // When user click on App Bar Action
                                Navigator.of(context).pushNamed('/cartPage');
                              },
                              child: Center(
                                child: Badge(
                                  showBadge: true,
                                  badgeContent: Text(
                                    '${numberItemInCart > 9 ? 9.toString() + "+" : numberItemInCart.toString()}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  child: Icon(Icons.shopping_cart, color: Colors.black),
                                ),
                              ),
                            );
                          } else
                            return Center(
                              child: Badge(
                                showBadge: true,
                                badgeContent: Text('0', style: TextStyle(color: Colors.white)),
                                child: Icon(Icons.shopping_cart, color: Colors.white),
                              ),
                            );
                        },
                      ),
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
                    'assets/icons/donut32-min.svg',
                    color: _tabController.index == 0 ? Colors.black : Colors.grey,
                  ),
                ),
                Tab(
                  text: 'Бургеры',
                  icon: SvgPicture.asset(
                    'assets/icons/burger_32-min.svg',
                    color: _tabController.index == 1 ? Colors.black : Colors.grey,
                  ),
                ),
                Tab(
                  text: 'Блинчики',
                  icon: SvgPicture.asset(
                    'assets/icons/puncake2_32.svg',
                    color: _tabController.index == 2 ? Colors.black : Colors.grey,
                  ),
                ),
                Tab(
                  text: 'Пицца',
                  icon: SvgPicture.asset(
                    'assets/icons/pizza_32.svg',
                    color: _tabController.index == 3 ? Colors.black : Colors.grey,
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
              DonutsScreen(),
              BurgersScreen(),
              PancakesScreen(),
              PizzaScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
