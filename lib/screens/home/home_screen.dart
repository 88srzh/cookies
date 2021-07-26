import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:cookie/components/custom_list_tile.dart';
import 'package:cookie/controller/user_controller.dart';
import 'package:cookie/locator.dart';
import 'package:cookie/models/cart.dart';
import 'package:cookie/models/user.dart';
import 'package:cookie/screens/auth_test_screen.dart';
import 'package:cookie/screens/description/new_description_card.dart';
import 'package:cookie/screens/home/donuts_screen.dart';
import 'package:cookie/screens/home/pizza_screen.dart';
import 'package:cookie/screens/profile/profile_screen.dart';
import 'package:cookie/screens/splash/splash_screen_new.dart';
import 'package:cookie/size_config.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cookie/screens/home/burgers_screen.dart';
import 'package:cookie/screens/home/pancakes_screen.dart';

class HomeScreen extends StatefulWidget {
  final UserModel currentUser;
  static String routeName = '/dindon_main';

  const HomeScreen({Key key, this.currentUser});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<Cart> newCarts = new List<Cart>.empty(growable: true);
  GlobalKey _bottomNavigationKey = GlobalKey();
  List<Widget> _pages;
  Widget _donutsPage;
  Widget _burgersPage;
  Widget _pancakesPage;
  Widget _pizzaPage;
  Widget _currentPage;
  
  @override
  void initState() {
    super.initState();
    _donutsPage = DonutsScreen();
    _burgersPage = BurgersScreen();
    _pancakesPage = PancakesScreen();
    _pizzaPage = PizzaScreen();

    _pages = [_donutsPage, _burgersPage, _pancakesPage, _pizzaPage];

    _currentPage = _donutsPage;
  }

  void changeTab(int index) {
    setState(() {
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 3,
      child: SafeArea(
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                CustomListTile(
                  icon: Icon(Icons.icecream),
                  title: 'DescriptionScreen',
                  onPressed: () => Navigator.pushNamed(context, NewDescriptionScreen.routeName),
                ),
                CustomListTile(
                  icon: Icon(Icons.person_add),
                  title: 'Профиль',
                  onPressed: () =>
                      Navigator.pushNamed(context, ProfileScreen.routeName),
                ),
                // CustomListTile(
                //   icon: Icon(FontAwesomeIcons.solidHeart),
                //   title: 'Любимое',
                //   onPressed: () =>
                // Navigator.pushNamed(context, FavoriteScreen.routeName),
                // ),
                // CustomListTile(
                //   icon: Icon(Icons.settings),
                //   title: 'Настройки',
                //   onPressed: () =>
                //       Navigator.pushNamed(context, SettingsScreen.routeName),
                // ),
                CustomListTile(
                  icon: Icon(Icons.supervised_user_circle_outlined),
                  title: 'ТестПользователей',
                  onPressed: () =>
                      Navigator.pushNamed(context, TestAuthScreen.routeName),
                ),
                CustomListTile(
                    icon: Icon(Icons.exit_to_app),
                    title: 'Выйти',
                    onPressed: () async {
                      var userController = locator.get<UserController>();
                      userController.signOut();
                      Navigator.pushNamed(context, SplashScreenNew.routeName);
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
                  width: getProportionateScreenWidth(60),
                  height: getProportionateScreenHeight(60),
                  child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: [
                      StreamBuilder(
                        stream: FirebaseDatabase.instance
                            .reference()
                            .child('NewCart')
                            .child('UNIQUE_USER_ID')
                            .onValue, //  TODO: fix to use FirebaseAuth uid
                        builder: (BuildContext context,
                            AsyncSnapshot<Event> snapshot) {
                          var numberItemInCart = 0;
                          if (snapshot.hasData) {
                            Map<dynamic, dynamic> map =
                                snapshot.data.snapshot.value;
                            newCarts.clear();
                            if (map != null) {
                              map.forEach((key, value) {
                                var newCart = Cart.fromJson(
                                    json.decode(json.encode(value)));
                                newCart.key = key;
                                newCarts.add(newCart);
                              });
                              // Calculate number
                              numberItemInCart = newCarts
                                  .map<int>((m) => m.quantity)
                                  .reduce((s1, s2) => s1 + s2);
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
                                  child: Icon(Icons.shopping_cart,
                                      color: Colors.black),
                                ),
                              ),
                            );
                          } else
                            return Center(
                              child: Badge(
                                showBadge: true,
                                badgeContent: Text('0',
                                    style: TextStyle(color: Colors.white)),
                                child: Icon(Icons.shopping_cart,
                                    color: Colors.white),
                              ),
                            );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Color.fromRGBO(248, 219, 221, 1.0),
          body: _currentPage,
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 0,
            items: [
              SvgPicture.asset(
                'assets/icons/donut32-min.svg',
                color: _currentPage == _donutsPage ? Colors.black : Colors.grey[700],
              ),
              SvgPicture.asset(
                'assets/icons/burger_32-min.svg',
                color: _currentPage == _burgersPage ? Colors.black : Colors.grey[700],
              ),
              SvgPicture.asset(
                'assets/icons/puncake2_32.svg',
                color: _currentPage == _pancakesPage ? Colors.black : Colors.grey[700],
              ),
              SvgPicture.asset(
                'assets/icons/pizza_32.svg',
                color: _currentPage == _pizzaPage ? Colors.black : Colors.grey[700],
              ),
            ],
            height: 55,
            color: Color.fromRGBO(255,223,185,150),
            buttonBackgroundColor: Colors.white54,
            backgroundColor: Colors.white30,
            animationCurve: Curves.ease,
            animationDuration: Duration(milliseconds: 600),
            onTap: (index) => changeTab(index),
            letIndexChange: (index) => true,
          ),
        ),
      ),
    );
  }
}
