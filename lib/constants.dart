import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFF17532);
const kSecondaryColor = Color(0xFFCC8053);
const kTextColor = Color(0xFF575E67);
const kBackgroundColor = Color(0xFFFCFAF8);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

//Form error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = 'Пожалуйста, введите Вашу почту';
const String kInvalidEmailError = 'Пожалуйста, введите действующую почту';
const String kPassNullError = 'Пожалуйста, введите Ваш пароль';
const String kShortPassError = 'Пароль слишком короткий';
const String kMatchPassError = 'Пароли не совпадают';
