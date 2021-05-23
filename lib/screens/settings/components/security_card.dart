import 'package:cookie/controller/user_controller.dart';
import 'package:cookie/locator.dart';
import 'package:cookie/models/user.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cookie/components/custom_settings_divider.dart';

class SecurityCard extends StatefulWidget {
  final UserModel currentUser;

  SecurityCard({this.currentUser});
  // const ToggleOnCard({this.text, this.icon, this.press});
  // final String text;
  // final Icon iconFirst, iconSecond;
  // final Function press;
  @override
  _SecurityCardState createState() => _SecurityCardState();
}

class _SecurityCardState extends State<SecurityCard> {
  var _passwordController = TextEditingController();
  var _newPasswordController = TextEditingController();
  var _repeatPasswordController = TextEditingController();

  var userController = locator.get<UserController>();

  bool checkCurrentPasswordValid = true;

  bool _tapFingerprin = false;
  bool _tapNotification = false;
  // bool _tapPassword = false;

  final GlobalKey<FormState> _formKeyNewPassword = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _newPasswordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SwitchListTile(
            value: _tapFingerprin,
            onChanged: (tapFingerprint) {
              setState(() => _tapFingerprin = tapFingerprint);
            },
            // leading: Icon(Icons.fingerprint),
            secondary: Icon(Icons.fingerprint),
            title: Text('Отпечаток пальца'),
            activeColor: Colors.red[300],
          ),
          CustomSettingsDivider(),
          // buildSwetchListTile(
          //     title: 'Получать уведомления',
          //     value: value1,
          //     onChanged: (val) => setState(() => value1 = val)),
          SwitchListTile(
            value: _tapNotification,
            onChanged: (tapNotification) {
              setState(() => _tapNotification = tapNotification);
            },
            title: Text('Получать уведомления'),
            activeColor: Colors.red[300],
            secondary: Icon(Icons.notifications_active),
          ),
          CustomSettingsDivider(),
          ListTile(
            title: Text('Сменить пароль'),
            leading: Icon(Icons.https),
            onTap: () {
              // ! implement apiToken
              // if (currentUser.value.apiToken == null)
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenWidth(5)),
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.all(Radius.circular(40)),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(248, 219, 221, 1.0),
                              Colors.orange[100]
                            ]),
                      ),
                      height: 270.0,
                      // width: 360.0,
                      child: Form(
                        key: _formKeyNewPassword,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(12),
                            vertical: getProportionateScreenWidth(15),
                          ),
                          child: Column(
                            children: [
                              // ! fix password correct
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Пароль',
                                    errorText: checkCurrentPasswordValid
                                        ? null
                                        : 'Неверный пароль'),
                                controller: _passwordController,
                              ),
                              // TextFormField(
                              TextFormField(
                                decoration:
                                    InputDecoration(hintText: 'Новый пароль'),
                                // obscureText: true,
                                controller: _newPasswordController,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Повторите новый пароль',
                                  hintStyle: TextStyle(
                                    color: Colors.black45,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                // obscureText: true,
                                controller: _repeatPasswordController,
                                validator: (value) {
                                  return _newPasswordController.text == value
                                      ? null
                                      : 'Пароли не совпадают';
                                },
                              ),
                              OutlinedButton(
                                onPressed: () async {
                                  checkCurrentPasswordValid =
                                      await userController
                                          .validateCurrentPassword(
                                              _passwordController.text);
                                  // check and set newpassword
                                  if (_formKeyNewPassword.currentState
                                          .validate() &&
                                      checkCurrentPasswordValid) {
                                    userController.updateUserPassword(
                                        _newPasswordController.text);
                                    print('Новый пароль сохранен');
                                    setState(() {});
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text(
                                  "Сохранить",
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
              // bottomSheetController.close.then(Navigator.pop(context));
              // Navigator.pop(context);
            },

            // activeColor: Colors.red[300],
          ),
        ],
      ),
    );
  }
}

// void showFloatingActionButton(bool value) {
//   setState(() {
//     showFab = false;
//   });
// }

// SwitchListTile buildSwetchListTile({
//   String title,
//   bool value,
//   void Function(bool) onChanged,
// }) {
//   return SwitchListTile(
//       title: Text(title), value: value, onChanged: onChanged);
// }

// void tapNotifications() {
//   final settings = Provider.of<SettingsItem>(context, listen: false);
//   setState(() {
//     if (settings.notifications) {
//       settings.notifications = false;
//     } else {
//       settings.notifications = true;
//     }
//   });
// }
// }
