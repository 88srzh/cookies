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
        // initialRoute: SplashScreen.routeName,
        home: DecisionsTree(),
        routes: routes,
      ),
    );
  }
}

class AuthentificationWrapper extends StatelessWidget {
  static String routeName = '/authWrapper';

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      // return LoginSuccessScreen();
      return Text('Успешно');
      // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
    }
    // ! nice try practically work
    // Future.delayed(Duration.zero, () {
    //   Navigator.pushNamed(context, SplashScreen.routeName);
    // });
    else {
      // return Container();
      return Error2Screen();
      // return DindonMainScreen();
    }
    // ! second try
    // SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    //   Navigator.pushNamed(context, SplashScreen.routeName);
  }
}

class AuthTypeSelector extends StatelessWidget {
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: FlatButton(
              onPressed: () => _pushPage(context, SignUpScreen()),
              child: Text('Регистрация'),
            ),
          ),
          Container(
            child: FlatButton(
                onPressed: () => _pushPage(context, SignInScreen()),
                child: Text('Войти')),
          ),
        ],
      ),
    );
  }
}

class DecisionsTree extends StatefulWidget {
  static String routeName = '/decisionsTree';
  @override
  _DecisionsTreeState createState() => _DecisionsTreeState();
}

class _DecisionsTreeState extends State<DecisionsTree> {
  User user;
  onRefresh(userCredential) {
    setState(() {
      user = userCredential;
    });
  }

  @override
  Widget build(BuildContext context) {
    User user;
    if (user == null) {
      return SignInPage(
          onSignInAnonymous: (userCredential) => onRefresh(userCredential));
    }
    return DindonMainScreen();
  }
}
