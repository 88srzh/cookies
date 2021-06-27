// import 'package:cookie/screens/complete_profile/complete_profile_screen.dart';
import 'package:cookie/controller/user_controller.dart';
import 'package:cookie/locator.dart';
// import 'package:cookie/screens/auth/authentification_service.dart';
import 'package:cookie/screens/complete_profile/complete_profile_screen.dart';
// import 'package:cookie/screens/sign_up/verify_screen.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_surfix_icon.dart';
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
  var _repeatPasswordController = TextEditingController();
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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(12)),
      // key: _formKey,
      child: Column(
        children: [
          // ! fix username form
          // buildUsernameFormField(),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(10)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(10)),
          buildConfirmPasswordFormField(),
          FormError(errors: errors),
          // SizedBox(height: getProportionateScreenHeight(100)),
          OutlinedButton(
            child: Text('Продолжить',
                style: TextStyle(color: Colors.black87, fontSize: 18)),
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                await locator.get<UserController>().signUpWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                // Go to complete profile page
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                // ! fix verify screen
                // Navigator.pushNamed(context, VerifyScreen.routeName);
              }
            },
          ),
          Text('Регистрируясь Вы принимаете Пользовательское соглашение'),
        ],
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      controller: _repeatPasswordController,
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
        filled: true,
        labelText: 'Повторите пароль',
        hintText: 'Повторите пароль',
        fillColor: Colors.white60,
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
        filled: true,
        labelText: 'Пароль',
        hintText: 'Пароль',
        fillColor: Colors.white60,
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(
        //   svgIcon: 'assets/icons/Lock.svg',
        // ),
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
        filled: true,
        labelText: 'Почта',
        hintText: 'Почта',
        fillColor: Colors.white60,
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
