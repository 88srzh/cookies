import 'package:cookie/main.dart';
import 'package:cookie/models/errors/2_404_error.dart';
import 'package:cookie/models/errors/7_error_2.dart';
import 'package:cookie/screens/cart/cart_screen.dart';
import 'package:cookie/screens/categories/categories_screen.dart';
import 'package:cookie/screens/complete_profile/complete_profile_screen.dart';
import 'package:cookie/screens/details/details_screen.dart';
import 'package:cookie/screens/dindon/components/dindon_screen.dart';
import 'package:cookie/screens/dindon/dindon_main.dart';
import 'package:cookie/screens/forgot_password/forgot_password_screen.dart';
import 'package:cookie/screens/home/home_screen.dart';
import 'package:cookie/screens/icecream/icecream_screen.dart';
import 'package:cookie/screens/login_success/login_success_screen.dart';
import 'package:cookie/screens/otp/otp_screen.dart';
import 'package:cookie/screens/profile/profile_screen.dart';
import 'package:cookie/screens/settings/settings_screen.dart';
import 'package:cookie/screens/sign_in/sign_in_example.dart';
import 'package:cookie/screens/sign_in/sign_in_screen.dart';
import 'package:cookie/screens/sign_in/sign_in_screen_new.dart';
import 'package:cookie/screens/sign_up/sign_up_screen.dart';
import 'package:cookie/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  CategoriesScreen.routeName: (context) => CategoriesScreen(),
  IceCreamScreen.routeName: (context) => IceCreamScreen(),
  DindonScreen.routeName: (context) => DindonScreen(),
  DindonMainScreen.routeName: (context) => DindonMainScreen(),
  SignInScreenNew.routeName: (context) => SignInScreenNew(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
  // SignInPage.routeName: (context) => SignInPage(),
  AuthentificationWrapper.routeName: (context) => AuthentificationWrapper(),
  Error404Screen.routeName: (context) => Error404Screen(),
  Error2Screen.routeName: (context) => Error2Screen(),
};
