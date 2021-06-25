import 'dart:io';

import 'package:cookie/controller/user_controller.dart';
import 'package:cookie/license/license_screen.dart';
import 'package:cookie/locator.dart';
import 'package:cookie/models/user.dart';
import 'package:cookie/screens/profile/components/avatar.dart';
import 'package:cookie/screens/profile/components/custom_list_tile.dart';
import 'package:cookie/screens/settings/components/heading_grey_card.dart';
import 'package:cookie/screens/sign_in/sign_in_screen.dart';
import 'package:cookie/screens/terms_of_use/terms_of_use_screen.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cookie/components/custom_settings_divider.dart';
import 'package:image_picker/image_picker.dart';

class BodyProfile extends StatefulWidget {
  final UserModel currentUser;

  const BodyProfile({this.currentUser});
  @override
  _BodyProfileState createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  var _passwordController = TextEditingController();
  var _newPasswordController = TextEditingController();
  var _repeatPasswordController = TextEditingController();

  var userController = locator.get<UserController>();

  bool checkCurrentPasswordValid = true;
  bool _tapSounds = false;

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
    UserModel _currentUser = locator.get<UserController>().currentUser;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]]),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Avatar(
              avatarUrl: _currentUser?.avatarUrl,
              onTap: () async {
                PickedFile pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
                File image = File(pickedImage.path);
                await locator.get<UserController>().uploadProfilePicture(image);
                setState(() {});
              },
            ),
            Text('\nПривет ${_currentUser.displayName}', style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
            SizedBox(height: 20),
            GreyCard(heading: 'Твой профиль'),
            CustomSettingsDivider(),
            ListTile(
              title: Text('Имя пользователя'),
              trailing: Text('${_currentUser?.displayName}'),
            ),
            CustomSettingsDivider(),
            ListTile(
              title: Text('Почта'),
              trailing: Text('${_currentUser?.email}'),
            ),
            CustomSettingsDivider(),
            ListTile(
              title: Text('Телефон'),
              trailing: Text('${_currentUser.phoneNumber}', style: TextStyle(fontSize: 14),),
            ),
            CustomSettingsDivider(),
            GreyCard(heading: 'Настройки приложения'),
            SwitchListTile(
                value: _tapSounds,
                onChanged: (tapSounds) {
                  setState(() => _tapSounds = tapSounds);
                },
                activeColor: Colors.red[300],
              title: Text('Включить звук'),
                ),
            CustomSettingsDivider(),
            GreyCard(heading: 'Аккаунт'),
            CustomProfileListTile(
              title: 'Сменить пароль',
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
                            height: SizeConfig.itemHeight * 0.71,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: getProportionateScreenWidth(10)),
                                  child: Text('Сменить пароль', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                ),
                                Divider(),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                    top: 6,
                                    bottom: 14,
                                  ),
                                  child: Form(
                                    key: _formKeyNewPassword,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: _passwordController,
                                          decoration: InputDecoration(
                                            labelText: 'Старый пароль',
                                            hintText: 'Старый пароль',
                                            errorText: checkCurrentPasswordValid ? null : 'Неверный пароль',
                                            fillColor: Colors.white60,
                                          ),
                                        ),
                                        SizedBox(height: 14),
                                        TextFormField(
                                          // key: _formKeyNewPassword,
                                          controller: _newPasswordController,
                                          decoration: InputDecoration(
                                            labelText: 'Новый пароль',
                                            hintText: 'Новый пароль',
                                            fillColor: Colors.white60,
                                          ),
                                        ),
                                      ],
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
                                              checkCurrentPasswordValid =
                                              await userController.validateCurrentPassword(_passwordController.text);
                                              if (_formKeyNewPassword.currentState.validate() && checkCurrentPasswordValid) {
                                                userController.updateUserPassword((_newPasswordController.text));
                                                print('Новый пароль сохранен');
                                                setState(() {});
                                                Navigator.pop(context);
                                              }
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
                    ));
              },
            ),
            CustomSettingsDivider(),
            GreyCard(heading: 'Приложение'),
            CustomProfileListTile(
              onTap: () {},
              title: 'Оценить приложение',

            ),
            CustomSettingsDivider(),
            CustomProfileListTile(
              onTap: () => Navigator.pushNamed(context, TermsOfUseScreen.routeName),
              title: 'Пользовательское соглашение',
            ),
            CustomSettingsDivider(),
            CustomProfileListTile(
              onTap: () => Navigator.pushNamed(context, LicenseScreen.routeName),
              title: 'Лицензия',
            ),
            CustomSettingsDivider(),
            CustomProfileListTile(
              onTap: () {},
              title: 'Напишите нам',
            ),
            CustomSettingsDivider(),
            CustomProfileListTile(
              onTap: () {
                var userController = locator.get<UserController>();
                userController.signOut();
                Navigator.pushNamed(context, SignInScreen.routeName);
              },
              title: 'Выйти',
            ),
            CustomSettingsDivider(),
            ListTile(
              onTap: () {},
              title: Text('Версия приложения 0.0.1'),
            ),
          ],
        ),
      ),
    );
  }
}
