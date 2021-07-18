import 'dart:async';
import 'dart:core';

import 'package:cookie/models/favorite.dart';
import 'package:cookie/locator.dart';
import 'package:cookie/models/settings.dart';
import 'package:cookie/routs.dart';
import 'package:cookie/screens/cart/cart_screen.dart';
import 'package:cookie/screens/description/descriprion_screen.dart';
import 'package:cookie/screens/splash/splash_screen_new.dart';
import 'package:cookie/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
// import 'package:lint/lint.dart';
// import 'package:surf_lint_rules/surf_lint_rules.dart';
// import 'package:lint/analysis_options.yaml';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServices();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  Widget build(BuildContext context) {
    // Widget buildLoading() => Center(child: CircularProgressIndicator());e
    return MultiProvider(
      providers: [
        // Provider<AuthentificationService>(
        //     create: (_) => AuthentificationService(FirebaseAuth.instance)),
        // StreamProvider(
        //   create: (context) => context.read<AuthentificationService>().authStateChanges,
        //   initialData: null,
        // ),
        // ChangeNotifierProvider(
        //   create: (context) => GoogleSignInProvider(),
        //   child: StreamBuilder(
        //     stream: FirebaseAuth.instance.authStateChanges(),
        //     builder: (context, snapshot) {
        //       final googleProvider = Provider.of<GoogleSignInProvider>(context);
        //       if (googleProvider.isSigningIn) {
        //         return buildLoading();
        //       } else if (snapshot.hasData) {
        //         return HomeScreen();
        //       } else {
        //         return SignInScreenNew();F
        //       }
        //     },
        //   ),
        // ),
        ChangeNotifierProvider.value(value: SettingsItem()),
        ChangeNotifierProvider.value(value: Favorite()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/cartPage':
              return PageTransition<dynamic>(settings: settings, child: CartScreen(), type: PageTransitionType.fade);
              break;
            case '/descriptionPage':
              return PageTransition<dynamic>(settings: settings, child: DescriptionScreen(), type: PageTransitionType.fade);
              break;
            default:
              return null;
          }
        },
        theme: theme(),
        initialRoute: SplashScreenNew.routeName,
        routes: routes,
      ),
    );
  }
}
