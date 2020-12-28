import 'package:cookie/models/Cart.dart';
import 'package:cookie/models/sweets.dart';
import 'package:cookie/routs.dart';
import 'package:cookie/screens/splash/splash_screen.dart';
import 'package:cookie/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
    // MultiProvider(providers: [
    //   ChangeNotifierProvider(
    //     create: (context) => Cart(
    //       sweets: allSweets[1],
    //       numOfItems: 1,
    //     ),
    //   ),
    // ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Cart>(
      create: (context) => Cart(sweets: null, numOfItems: null),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        // initialRoute: CategoriesScreen.routeName,
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
