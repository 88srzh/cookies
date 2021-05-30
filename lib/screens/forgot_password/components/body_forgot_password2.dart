import 'package:cookie/components/custom_surfix_icon.dart';
import 'package:cookie/controller/user_controller.dart';
import 'package:cookie/locator.dart';
import 'package:cookie/models/user.dart';
import 'package:flutter/material.dart';

class BodyForgotPassword2 extends StatefulWidget {
  @override
  _BodyForgotPassword2State createState() => _BodyForgotPassword2State();
}

class _BodyForgotPassword2State extends State<BodyForgotPassword2> {
  var _emailController = TextEditingController();
  final _formKeyEmail = GlobalKey<FormState>();
  var userController = locator.get<UserController>();
  // UserModel _currentUser = locator.get<UserController>().currentUser;
  String email;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // stops: [0.3, 1.8],
          colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]],
        ),
      ),
      child: Container(
        child: Column(
          children: [
            Form(
              key: _formKeyEmail,
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Почта',
                  hintText: 'Введите Вашу почту',
                  fillColor: Colors.white,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: CustomSurffixIcon(
                    svgIcon: 'assets/icons/Mail.svg',
                  ),
                ),
              ),
            ),
            OutlinedButton(
              child: Text('Отправить'),
              onPressed: () async {
                _formKeyEmail.currentState.save();
                final user = userController.resetPassword(email);
                return Navigator.pop(context);
                // print(_email);
                // Dialog(
                //   child: Text('Новый пароль отправлен Вам на почту'),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
