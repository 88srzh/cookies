// import 'package:cookie/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _repasswordController = TextEditingController();
  var _usernameController = TextEditingController();
  String email;
  String password;
  String confirmPassword;
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
          buildUsernameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfirmPasswordFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: 'Продолжить',
            // press: () {
            // if (_formKey.currentState.validate()) {
            //   // Go to complete profile page
            //   Navigator.pushNamed(context, CompleteProfileScreen.routeName);
            // }
            // },
            // press: () async {
            //   // validateSubmitRegister();
            //   try {
            //     User user = (await FirebaseAuth.instance
            //             .createUserWithEmailAndPassword(
            //                 email: _emailController.text,
            //                 password: _passwordController.text))
            //         .user;
            //     // final user = await _auth.signInWithEmailAndPassword(
            //     //     email: email, password: password);
            //     // context.read<AuthenticationService>().signIn(
            //     //       email: emailController.text.trim(),
            //     //       password: passwordController.text.trim(),
            //     //     );
            //     if (user != null) {
            //       user
            //           .updateProfile(displayName: _usernameController.text)
            //           .then((value) => Text('Update successful'));
            //       Navigator.pushNamed(context, DindonMainScreen.routeName);
            //       // showDialog(
            //       //     context: context,
            //       //     child: Column(
            //       //       children: [
            //       //         Material(
            //       //           child: Text('You enter'),
            //       //         )
            //       //       ],
            //       //     ));
            //       // Navigator.pushNamed(context, DindonMainScreen.routeName);
            //       // } else if (user == null) {
            //       //   Fluttertoast.showToast(
            //       //       msg: "This is Center Short Toast",
            //       //       toastLength: Toast.LENGTH_SHORT,
            //       //       gravity: ToastGravity.CENTER,
            //       //       timeInSecForIosWeb: 1,
            //       //       backgroundColor: Colors.red,
            //       //       textColor: Colors.white,
            //       //       fontSize: 16.0);
            //       // }
            //     }
            //   } catch (e) {
            //     // print(Text('Вы не зарегистрированы'));
            //     // Navigator.pushNamed(context, Error2Screen.routeName);
            //     print(e);
            //     _usernameController.text = '';
            //     _passwordController.text = '';
            //     _repasswordController.text = '';
            //     _emailController.text = '';
            //   }

            //   // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
            //   // }
            //   // Navigator.pushNamed(context, SignUpScreen.routeName);
            // },
          ),
        ],
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      controller: _repasswordController,
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        if (password == confirmPassword) {
          removeError(error: kMatchPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "";
        } else if (password != value) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      // keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Подтвердите пароль',
        hintText: 'Повторите пароль',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: 'assets/icons/Lock.svg',
        ),
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
        password = value;
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
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: 'assets/icons/Lock.svg',
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      // keyboardType: TextInputType.emailAddress,
      controller: _emailController,
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
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: 'assets/icons/Mail.svg',
        ),
      ),
    );
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
      controller: _usernameController,
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
        labelText: 'Имя пользователя',
        hintText: 'Введите имя пользователя',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: 'assets/icons/Mail.svg',
        ),
      ),
    );
  }
}
