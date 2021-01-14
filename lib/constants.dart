import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromRGBO(41, 38, 43, 0.9);
const kSecondaryColor = Color(0xFFCC8053);
const kTextColor = Color(0xFF575E67);
const kBackgroundColor = Color.fromRGBO(248, 219, 221, 1);

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
const String kNameNullError = 'Пожалуйста, введите Ваше имя';
const String kPhoneNumberNullError = 'Пожалуйста, введите введите Ваш телефон';
const String kAddressNullError = 'Пожалуйста, введите Ваш адрес';

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
    vertical: getProportionateScreenWidth(15),
  ),
  enabledBorder: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  border: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: kTextColor),
  );
}
