// import 'package:cookie/components/custom_suffix_icon.dart';
import 'package:cookie/components/form_error.dart';
import 'package:cookie/controller/user_controller.dart';
import 'package:cookie/locator.dart';
import 'package:cookie/screens/forgot_password/forgot_password2.dart';
// import 'package:cookie/screens/forgot_password/forgotten_password_screen_new.dart';
import 'package:cookie/screens/home/home_screen.dart';
// import 'package:cookie/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  bool _obskureText = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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

  // void _toggle() {
  //   setState(() {
  //     _obskureText = !_obskureText;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(12)),
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(10)),
          Row(
            children: [
              // Checkbox(
              //   value: remember,
              //   activeColor: kPrimaryColor,
              //   onChanged: (value) {
              //     setState(() {
              //       remember = value;
              //     });
              //   },
              // ),
              // Text('Запомнить'),
              Spacer(),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, ForgotPassword2.routeName),
                child: Text(
                  // ! Add route to screen
                  'Забыли пароль?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(10)),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                  style: ButtonStyle(
                    // TODO change color when textfields not empty
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(getProportionateScreenWidth(8)),
                        side: BorderSide(color: Colors.redAccent),
                      ),
                    ),
                  ),
                // TODO fix not display error when wrong data
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(14)),
                  child: Text('Войти', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                onPressed: () async {
                  try {
                    await locator
                        .get<UserController>()
                        .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
          ],
          ),
          // SizedBox(height: getProportionateScreenWidth(10)),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      obscureText: _obskureText,
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
      // TODO optimize inputderoration
      decoration: InputDecoration(
        labelText: 'Пароль',
        hintText: 'Пароль',
        fillColor: Colors.white60,
        filled: true,
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailController,
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
        filled: true,
        labelText: 'Почта',
        hintText: 'Почта',
        fillColor: Colors.white60,
      ),
    );
  }

  void validateSubmitRegister() async {
    final form = _formKey.currentState;
    if (_formKey.currentState.validate()) {
      form.save();
    }
  }
}
