import 'package:cookie/routs.dart';
import 'package:cookie/screens/splash/splash_screen.dart';
import 'package:cookie/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      // initialRoute: CategoriesScreen.routeName,
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
