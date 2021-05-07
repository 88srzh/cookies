// import 'package:cookie/models/cart.dart';
import 'package:cookie/models/favorite.dart';
// import 'package:cookie/models/items_info.dart';
// import 'package:cookie/models/orders.dart';
// import 'package:cookie/models/cart.dart';
import 'package:cookie/locator.dart';
// import 'package:cookie/models/orders.dart';
import 'package:cookie/models/settings.dart';
// import 'package:cookie/models/items.dart';
import 'package:cookie/routs.dart';
// import 'package:cookie/screens/auth/authentification_service.dart';
// import 'package:cookie/screens/auth/google_sign_in.dart';
import 'package:cookie/screens/cart/cart_screen.dart';
import 'package:cookie/screens/description/descriprion_screen.dart';
// import 'package:cookie/screens/home/home_screen.dart';
// import 'package:cookie/screens/sign_in/sign_in_screen.dart';
import 'package:cookie/screens/splash/splash_screen.dart';
import 'package:cookie/theme.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServices();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildLoading() => Center(child: CircularProgressIndicator());
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
        //         return SignInScreenNew();
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
              return PageTransition(settings: settings, child: CartScreen(), type: PageTransitionType.fade);
              break;
            case '/descriptionPage':
              return PageTransition(settings: settings, child: DescriptionScreen(), type: PageTransitionType.fade);
              break;
            default:
              return null;
          }
        },
        theme: theme(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
