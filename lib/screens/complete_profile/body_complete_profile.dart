import 'package:flutter/material.dart';

import '../../components/custom_surfix_icon.dart';
import '../../constants.dart';
import '../../size_config.dart';
import '../../size_config.dart';

class BodyCompleteProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Text(
              'Завершите профиль',
              style: headingStyle,
            ),
            Text(
              'Завершите заполнение или \nпродолжите через социальные сети',
              textAlign: TextAlign.center,
            ),
            CompleteProfileForm(),
          ],
        ),
      ),
    );
  }
}

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;
  String phoneNumber;
  String address;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
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
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => firstName = newValue,
            decoration: InputDecoration(
              labelText: 'Фамилия',
              hintText: 'Введите Вашу фамилию',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(
                svgIcon: 'assets/icons/User.svg',
              ),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => firstName = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kNameNullError);
              }
              return null;
            },
            validator: (value) {
              if (value.isEmpty) {
                addError(error: kNameNullError);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Имя',
              hintText: 'Введите Ваше имя',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(
                svgIcon: 'assets/icons/User.svg',
              ),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => firstName = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kNameNullError);
              }
              return null;
            },
            validator: (value) {
              if (value.isEmpty) {
                addError(error: kNameNullError);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Имя',
              hintText: 'Введите Ваше имя',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(
                svgIcon: 'assets/icons/User.svg',
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Имя',
        hintText: 'Введите Ваше имя',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: 'assets/icons/User.svg',
        ),
      ),
    );
  }
}
