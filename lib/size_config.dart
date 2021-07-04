import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData = 0.0 as MediaQueryData;
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double defaultSize = 0.0;
  static Orientation orientation = Orientation.portrait;
  // Для размера карточки
  var size;
  var screenPadding;
  static double itemHeight = 0.0;
  static double itemWidth = 0.0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    // full screen width and height
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    screenPadding = _mediaQueryData.padding;
    orientation = _mediaQueryData.orientation;
    // Для размера карточки
    size = MediaQuery.of(context).size;
    itemHeight = (size.height - kToolbarHeight - 24) / 2.4;
    itemWidth = size.width / 2;
  }
}

double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  return (inputHeight / 812.0) * screenHeight;
}

double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 375.0) * screenWidth;
}
