import 'package:cookie/constants.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white70,
    fontFamily: 'Circular Std',
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    // buttonColor: Colors.black,
    tabBarTheme: tabBarTheme(),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey[300]),
    borderRadius: BorderRadius.circular(8),
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    // bodyText1: TextStyle(color: Colors.black),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    centerTitle: true,
    color: Color.fromRGBO(248, 219, 221, 1.0),
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Color(0xFF8B8B8B),
        fontSize: 18.0,
      ),
    ),
  );
}

TabBarTheme tabBarTheme() {
  return TabBarTheme(
    // unselectedLabelColor: Colors.grey,
    labelColor: Colors.black,
    unselectedLabelColor: Colors.grey,
    // unselectedLabelStyle: Colors.grey,
    // labelPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: (Colors.black), width: 2.0),
      insets: EdgeInsets.fromLTRB(30.0, 40.0, 25.0, 0.0),
    ),
    // unselectedLabelColor: Color.fromRGBO(202, 195, 199, 1.0),
    // unselectedLabelColor: Color.fromRGBO(166, 166, 166, 1.0),

    // indicator: BoxDecoration(
    //   border: Border(

    //     top: BorderSide(width: 3,color: Theme.of(context).accentColor,),
    // ),
    // ),
  );
}
