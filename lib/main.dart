import 'package:cookie/models/Cart.dart';
import 'package:cookie/models/sweets.dart';
import 'package:cookie/routs.dart';
import 'package:cookie/screens/auth/authentication_service.dart';
import 'package:cookie/screens/dindon/dindon_main.dart';
import 'package:cookie/screens/login_success/login_success_screen.dart';
import 'package:cookie/screens/sign_up/sign_up_screen.dart';
import 'package:cookie/screens/splash/splash_screen.dart';
import 'package:cookie/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges),
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, Cart>(
          create: (context) => Cart(),
          update: (context, catalog, cart) {
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      // create: (context) =>
      // Cart(sweets: CatalogModel().allSweets[0], numOfItems: 1),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        // initialRoute: DindonMainScreen.routeName,
        initialRoute: SplashScreen.routeName,
        // home: AuthentificationWrapper(),
        // initialRoute: AuthentificationWrapper.routeName,
        // initialRoute: SettingsScreen.routeName,
        routes: routes,
      ),
    );
  }
}

// class AuthentificationWrapper extends StatelessWidget {
//   const AuthentificationWrapper({Key key}) : super(key: key);
//   static String routeName = '/authWrapper';

//   @override
//   Widget build(BuildContext context) {
//     final user = context.watch<User>();

//     if (user != null) {
//       // return LoginSuccessScreen();
//       return Text('Успешно');
//       // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
//     }
//     // return SignUpScreen();
//     // return LoginSuccessScreen();
//     return Text('Не успешно');
//     // Navigator.pushNamed(context, SignUpScreen.routeName);
//   }
// }
