import 'package:cookie/models/Cart.dart';
import 'package:cookie/models/sweets.dart';
import 'package:cookie/routs.dart';
import 'package:cookie/screens/auth/authentification_service.dart';
import 'package:cookie/screens/splash/splash_screen.dart';
import 'package:cookie/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
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
        Provider<AuthentificationService>(
            create: (_) => AuthentificationService(FirebaseAuth.instance)),
        StreamProvider(
            create: (context) =>
                context.read<AuthentificationService>().authStateChanges),
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

class FApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return SomethingWentWrong();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MyApp();
          }
          return Loading();
        });
  }
}

class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Check for errors',
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Otherwise, show something whilst waiting for initialization to complete',
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}
