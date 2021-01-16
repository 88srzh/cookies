import 'package:cookie/models/Cart.dart';
import 'package:cookie/models/sweets.dart';
import 'package:cookie/routs.dart';
import 'package:cookie/screens/dindon/dindon_main.dart';
import 'package:cookie/screens/settings/settings_screen.dart';
// import 'package:cookie/screens/dindon_main/dindon_main.dart';
import 'package:cookie/screens/splash/splash_screen.dart';
import 'package:cookie/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provider(create: (context) => Cart()),
        // Provider(create: (context) => ColorDots()),
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, Cart>(
          create: (context) => Cart(),
          update: (context, catalog, cart) {
            cart.catalog = catalog;
            return cart;
          },
        ),
        Provider(create: (context) => CatalogModel()),
      ],
      // create: (context) =>
      // Cart(sweets: CatalogModel().allSweets[0], numOfItems: 1),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        // initialRoute: DindonMainScreen.routeName,
        initialRoute: SplashScreen.routeName,
        // initialRoute: SettingsScreen.routeName,
        routes: routes,
      ),
    );
  }
}
