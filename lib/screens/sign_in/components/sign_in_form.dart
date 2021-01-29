import 'package:cookie/components/continue_button.dart';
import 'package:cookie/components/custom_surfix_icon.dart';
import 'package:cookie/components/form_error.dart';
import 'package:cookie/models/errors/2_404_error.dart';
import 'package:cookie/models/errors/7_error_2.dart';
import 'package:cookie/screens/auth/authentication_service.dart';
import 'package:cookie/screens/dindon/dindon_main.dart';
import 'package:cookie/screens/forgot_password/forgot_password_screen.dart';
import 'package:cookie/screens/login_success/login_success_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cookie/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  final Function(User) onSignInAnonymous;

  SignForm({@required this.onSignInAnonymous});

  loginAnonymous() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
    onSignInAnonymous(userCredential.user);
  }

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // final _auth = FirebaseAuth.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text('Запомнить'),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  'Забыли пароль?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          ContinueButton(
            text: 'Продолжить',
            press: () {
              // TODO: исправить!
              // loginAnonymous();
            },
            // press: () async {
            // validateSubmitRegister();
            // ! third try
            // try {
            //   UserCredential userCredential = await FirebaseAuth.instance
            //       .signInWithEmailAndPassword(
            //           email: _emailController.text.trim(),
            //           password: _passwordController.text.trim());
            // } on FirebaseAuthException catch (e) {
            // if (e.code == 'user not found') {
            //   print('no user found');
            // } else if (e.code == 'wrong-password') {
            //   print('wrong password');
            // }
            //   }
            // }

            // ! second try
            //  try { User user = (await FirebaseAuth.instance
            //           .signInWithEmailAndPassword(
            //               email: _emailController.text,
            //               password: _passwordController.text))
            //       .user;} catch (e) {
            //         Text('exception');
            //       }
            //       if (user != null) {

            // }
            // ! first try
            // final user = await auth.signInWithEmailAndPassword(
            //     email: email, password: password);
            // context.read<AuthenticationService>().signIn(
            //       email: _emailController.text.trim(),
            //       password: _passwordController.text.trim(),
            //     );
            // auth.authStateChanges().listen((user) {
            // if (user == null) {
            //   print('Пользователь не зашел');
            // } else {
            //   print('Пользователь зашел');
            // }
            // });
            // if (user != null) {
            //   Navigator.pushNamed(context, DindonMainScreen.routeName);
            //   showDialog(
            //       context: context,
            //       child: Column(
            //         children: [
            //           Material(
            //             child: Text('You enter'),
            //           )
            //         ],
            //       ));
            //   Navigator.pushNamed(context, DindonMainScreen.routeName);
            // } else {
            //   print(Text('Вы не зарегистрированы'));
            //   Navigator.pushNamed(context, Error2Screen.routeName);
            // }
            // },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      // keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Пароль',
        hintText: 'Введите пароль',
        fillColor: Colors.white24,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: 'assets/icons/Lock.svg',
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _emailController,
      // keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Почта',
        hintText: 'Введите Вашу почту',
        fillColor: Colors.white,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: 'assets/icons/Mail.svg',
        ),
      ),
    );
  }

  void validateSubmitRegister() async {
    final form = _formKey.currentState;
    if (_formKey.currentState.validate()) {
      form.save();
      // AuthResult result = await FirebaseAuth.instance
      //     .createUserWithEmailAndPassword(email: email, password: password);
      // FirebaseUser user = result.user;
    }
  }
}
