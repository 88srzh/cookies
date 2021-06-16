// import 'package:cookie/components/custom_suffix_icon.dart';
import 'package:cookie/components/form_error.dart';
import 'package:cookie/controller/user_controller.dart';
import 'package:cookie/locator.dart';
// import 'package:cookie/screens/forgot_password/forgot_password2.dart';
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
  final _restorePasswordKey = GlobalKey<FormState>();
  var userController = locator.get<UserController>();
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
              Spacer(),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Builder(
                      builder: (context) => AlertDialog(
                        contentPadding: EdgeInsets.all(0.0),
                        backgroundColor: Colors.transparent,
                        content: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: getProportionateScreenWidth(10)),
                                  child: Text('Восстановить пароль', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                ),
                                Divider(),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8), horizontal: getProportionateScreenWidth(15)),
                                  child: Center(child:
                                    Text('Мы отправим ссылку для восстановления пароля Вам на почту', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: getProportionateScreenWidth(10),
                                    right: getProportionateScreenWidth(10),
                                    top: getProportionateScreenWidth(6),
                                    bottom: getProportionateScreenWidth(14),
                                  ),
                                  child: Form(
                                    // may be need another name to key
                                    key: _restorePasswordKey,
                                      child: TextFormField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          labelText: 'Почта',
                                          hintText: 'Почта',
                                          fillColor: Colors.white60,
                                        ),
                                      ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[300]),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
                                                side: BorderSide(color: Colors.grey[300]),
                                              ),
                                            ),
                                          ),
                                            onPressed: () => Navigator.pop(context),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(12)),
                                              child: Text('Отмена'.toUpperCase(), style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
                                            )),
                                      ),
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
                                                side: BorderSide(color: Colors.redAccent),
                                              ),
                                            ),
                                          ),
                                            onPressed: () async {
                                              _restorePasswordKey.currentState.save();
                                              final currentUser = userController.resetPassword(email);
                                              return Navigator.pop(context);
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(12)),
                                              child: Text('Отправить'.toUpperCase(), style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                    // Navigator.pushNamed(context, ForgotPassword2.routeName),
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
