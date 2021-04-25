import 'package:cookie/license/license_screen.dart';
import 'package:cookie/screens/auth/authentification_page.dart';
import 'package:cookie/screens/cart/cart_screen.dart';
import 'package:cookie/screens/complete_profile/complete_profile_screen.dart';
import 'package:cookie/screens/description/descriprion_screen.dart';
import 'package:cookie/screens/errors/something_went_wrong.dart';
import 'package:cookie/screens/favorite/favorite_screen.dart';
import 'package:cookie/screens/home/home_screen.dart';
import 'package:cookie/screens/forgot_password/forgot_password_screen.dart';
import 'package:cookie/screens/login_success/login_success_screen.dart';
import 'package:cookie/screens/otp/otp_screen.dart';
import 'package:cookie/screens/profile/profile_screen.dart';
import 'package:cookie/screens/settings/settings_screen.dart';
import 'package:cookie/screens/sign_in/sign_in_screen.dart';
import 'package:cookie/screens/sign_up/sign_up_screen.dart';
import 'package:cookie/screens/splash/splash_screen.dart';
import 'package:cookie/screens/auth/authentification_wrapper.dart';
import 'package:cookie/screens/terms_of_use/terms_of_use_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:cookie/screens/auth/google_logout_page.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  // DescriptionScreen.routeName: (context) => DescriptionScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  SignInScreenNew.routeName: (context) => SignInScreenNew(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
  // Error404Screen.routeName: (context) => Error404Screen(),
  // Error2Screen.routeName: (context) => Error2Screen(),
  AuthentificationWrapper.routeName: (context) => AuthentificationWrapper(),
  AuthentificationPage.routename: (context) => AuthentificationPage(),
  GoogleLogoutPage.routeName: (context) => GoogleLogoutPage(),
  SomethingWentWrongScreen.routeName: (context) => SomethingWentWrongScreen(),
  FavoriteScreen.routeName: (context) => FavoriteScreen(),
  TermsOfUseScreen.routeName: (context) => TermsOfUseScreen(),
  LicenseScreen.routeName: (context) => LicenseScreen(),
};
