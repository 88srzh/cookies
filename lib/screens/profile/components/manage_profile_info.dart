import 'package:cookie/controller/user_controller.dart';
import 'package:cookie/locator.dart';
import 'package:cookie/models/user.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class ManageProfileInformationWidget extends StatefulWidget {
  final UserModel currentUser;

  const ManageProfileInformationWidget({this.currentUser});
  @override
  _ManageProfileInformationWidgetState createState() =>
      _ManageProfileInformationWidgetState();
}

class _ManageProfileInformationWidgetState
    extends State<ManageProfileInformationWidget> {
  var _displayNameController = TextEditingController();
  var _passwordController = TextEditingController();
  var _newPasswordController = TextEditingController();
  var _repeatPasswordController = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  bool checkCurrentPasswordValid = true;

  @override
  void initState() {
    _displayNameController.text = widget.currentUser.displayName;
    super.initState();
  }

  @override
  void dispose() {
    _displayNameController.dispose();
    _passwordController.dispose();
    _newPasswordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(hintText: "Сменить имя пользователя"),
              controller: _displayNameController,
            ),
            SizedBox(height: 20.0),
            Flexible(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Manage Password",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Пароль',
                        errorText: checkCurrentPasswordValid
                            ? null
                            : 'Пожалуйста проверьте свой текущий пароль',
                      ),
                      controller: _passwordController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Новый пароль'),
                      obscureText: true,
                      controller: _newPasswordController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Повторите пароль'),
                      obscureText: true,
                      controller: _repeatPasswordController,
                      validator: (value) {
                        return _newPasswordController.text == value
                            ? null
                            : 'Пароли не совпадают';
                      },
                    )
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var userController = locator.get<UserController>();
                if (widget.currentUser.displayName !=
                    _displayNameController.text) {
                  var displayName = _displayNameController.text;
                  userController.updateDisplayName(displayName);
                }

                checkCurrentPasswordValid = await userController
                    .validateCurrentPassword(_passwordController.text);
                setState(() {});
                // check password
                if (_formKey.currentState.validate() &&
                    checkCurrentPasswordValid) {
                  userController
                      .updateUserPassword(_newPasswordController.text);
                  setState(() {});
                  Navigator.pop(context);
                }
              },
              child: Text("Сохранить"),
            )
          ],
        ),
      ),
    );
  }
}
