import 'package:cookie/license/license_screen.dart';
import 'package:cookie/screens/auth/authentification_page.dart';
import 'package:cookie/screens/auth_test_screen.dart';
// import 'package:cookie/screens/cart/cart_screen.dart';
import 'package:cookie/screens/complete_profile/complete_profile_screen.dart';
import 'package:cookie/screens/description/new_description_card.dart';
// import 'package:cookie/screens/description/descriprion_screen.dart';
import 'package:cookie/screens/errors/something_went_wrong.dart';
import 'package:cookie/screens/forgot_password/forgot_password2.dart';
import 'package:cookie/screens/home/burgers_screen.dart';
import 'package:cookie/screens/home/donuts_screen.dart';
// import 'package:cookie/screens/favorite/favorite_screen.dart';
import 'package:cookie/screens/home/home_screen.dart';
import 'package:cookie/screens/login_success/login_success_screen.dart';
import 'package:cookie/screens/otp/otp_screen.dart';
import 'package:cookie/screens/profile/profile_screen.dart';
import 'package:cookie/screens/profile/profile_example_screen.dart';
import 'package:cookie/screens/settings/settings_screen.dart';
import 'package:cookie/screens/sign_in/sign_in_screen.dart';
import 'package:cookie/screens/sign_up/sign_up_screen.dart';
// import 'package:cookie/screens/sign_up/verify_screen.dart';
// import 'package:cookie/screens/splash/splash_screen.dart';
// import 'package:cookie/screens/auth/authentification_wrapper.dart';
import 'package:cookie/screens/splash/splash_screen_new.dart';
import 'package:cookie/screens/terms_of_use/terms_of_use_screen.dart';
import 'package:flutter/widgets.dart';
// import 'package:cookie/screens/auth/google_logout_page.dart';

final Map<String, WidgetBuilder> routes = {
  // SplashScreen.routeName: (context) => SplashScreen(),
  SplashScreenNew.routeName: (context) => SplashScreenNew(),
  // ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  // CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  // DescriptionScreen.routeName: (context) => DescriptionScreen(),
  NewDescriptionScreen.routeName: (context) => NewDescriptionScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
  // Error404Screen.routeName: (context) => Error404Screen(),
  // Error2Screen.routeName: (context) => Error2Screen(),
  // AuthentificationWrapper.routeName: (context) => AuthentificationWrapper(),
  AuthentificationPage.routename: (context) => AuthentificationPage(),
  // GoogleLogoutPage.routeName: (context) => GoogleLogoutPage(),
  SomethingWentWrongScreen.routeName: (context) => SomethingWentWrongScreen(),
  // FavoriteScreen.routeName: (context) => FavoriteScreen(),
  TermsOfUseScreen.routeName: (context) => TermsOfUseScreen(),
  LicenseScreen.routeName: (context) => LicenseScreen(),
  TestAuthScreen.routeName: (context) => TestAuthScreen(),
  ProfileView.routeName: (context) => ProfileView(),
  // VerifyScreen.routeName: (context) => VerifyScreen(),
  DonutsScreen.routeName: (context) => DonutsScreen(),
  BurgersScreen.routeName: (context) => BurgersScreen(),
  ForgotPassword2.routeName: (context) => ForgotPassword2(),
};
