import 'package:cookie/login_page.dart';
import 'package:cookie/models/Cart.dart';
import 'package:cookie/models/errors/7_error_2.dart';
import 'package:cookie/models/sweets.dart';
import 'package:cookie/routs.dart';
import 'package:cookie/screens/auth/authentication_service.dart';
import 'package:cookie/screens/dindon/dindon_main.dart';
import 'package:cookie/screens/login_success/login_success_screen.dart';
import 'package:cookie/screens/sign_in/components/sign_in_example2.dart';
import 'package:cookie/screens/sign_in/sign_in_screen.dart';
import 'package:cookie/screens/sign_up/sign_up_screen.dart';
import 'package:cookie/screens/splash/splash_screen.dart';
import 'package:cookie/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
        // Provider<AuthenticationService>(
        //   create: (_) => AuthenticationService(FirebaseAuth.instance),
        // ),
        // StreamProvider(
        //     create: (context) =>
        //         context.read<AuthenticationService>().authStateChanges),
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
        initialRoute: SplashScreen.routeName,
        // home: DecisionsTree(),
        routes: routes,
      ),
    );
  }
}

// class DecisionsTree extends StatefulWidget {
//   static String routeName = '/decisionsTree';
//   @override
//   _DecisionsTreeState createState() => _DecisionsTreeState();
// }

// class _DecisionsTreeState extends State<DecisionsTree> {
//   User user;
//   onRefresh(userCredential) {
//     setState(() {
//       user = userCredential;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // User user;
//     if (user == null) {
//       return SignInPage(
//           onSignInAnonymous: (userCredential) => onRefresh(userCredential));
//     }
//     return SplashScreen();
//   }
// }
