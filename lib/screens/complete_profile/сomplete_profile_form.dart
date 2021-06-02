// import 'package:cookie/screens/otp/otp_screen.dart';
import 'package:cookie/controller/user_controller.dart';
import 'package:cookie/locator.dart';
import 'package:cookie/models/user.dart';
import 'package:cookie/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../components/custom_surfix_icon.dart';
import '../../components/form_error.dart';
import '../../constants.dart';
import '../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  final UserModel currentUser;

  const CompleteProfileForm({this.currentUser});
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  var _displayNameController = TextEditingController();
  // var _displaySurNameController = TextEditingController();
  // ! fif phoneNumber
  // var _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  String displayName;
  // String displaySurName;
  String phoneNumber;
  // ! till not complete
  // String address;

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

  void dispose() {
    _displayNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildDisplayNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          // buildDisplaySurNameFormField(),
          // SizedBox(height: getProportionateScreenHeight(30)),
          // buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          // buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.35),
          OutlinedButton(
              child: Text(
                'Продолжить',
                style: TextStyle(color: Colors.black87, fontSize: 22),
              ),
              onPressed: () async {
                var userController = locator.get<UserController>();
                var displayName = _displayNameController.text;
                userController.updateDisplayName(displayName);
                Navigator.pushNamed(context, HomeScreen.routeName);

                // ! validate
                // if (_formKey.currentState.validate()) {
                // ! fix otp screen
                // Go to OTP screen
                // Navigator.pushNamed(context, OtpScreen.routeName);
              }
              // },
              ),
        ],
      ),
    );
  }

  // ! address
  // TextFormField buildAddressFormField() {
  //   return TextFormField(
  //     onSaved: (newValue) => address = newValue,
  //     onChanged: (value) {
  //       if (value.isNotEmpty) {
  //         removeError(error: kAddressNullError);
  //       }
  //       return null;
  //     },
  //     validator: (value) {
  //       if (value.isEmpty) {
  //         addError(error: kAddressNullError);
  //         return "";
  //       }
  //       return null;
  //     },
  //     decoration: InputDecoration(
  //       labelText: 'Адрес',
  //       hintText: 'Введите адрес',
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon: CustomSurffixIcon(
  //         svgIcon: 'assets/icons/Location point.svg',
  //       ),
  //     ),
  //   );
  // }

  // TextFormField buildPhoneNumberFormField() {
  //   return TextFormField(
  //     keyboardType: TextInputType.number,
  //     onSaved: (newValue) => phoneNumber = newValue,
  //     onChanged: (value) {
  //       if (value.isNotEmpty) {
  //         removeError(error: kPhoneNumberNullError);
  //       }
  //       return null;
  //     },
  //     validator: (value) {
  //       if (value.isEmpty) {
  //         addError(error: kPhoneNumberNullError);
  //         return "";
  //       }
  //       return null;
  //     },
  //     controller: _phoneNumberController,
  //     decoration: InputDecoration(
  //       labelText: 'Телефон',
  //       hintText: 'Введите телефон',
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon: CustomSurffixIcon(
  //         svgIcon: 'assets/icons/Phone.svg',
  //       ),
  //     ),
  //   );
  // }

  // TextFormField buildDisplaySurNameFormField() {
  //   return TextFormField(
  //     onSaved: (newValue) => displaySurName = newValue,
  //     controller: _displaySurNameController,
  //     decoration: InputDecoration(
  //       labelText: 'Фамилия',
  //       hintText: 'Введите фамилию',
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon: CustomSurffixIcon(
  //         svgIcon: 'assets/icons/User.svg',
  //       ),
  //     ),
  //   );
  // }

  TextFormField buildDisplayNameFormField() {
    return TextFormField(
      onSaved: (newValue) => displayName = newValue,
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
      controller: _displayNameController,
      decoration: InputDecoration(
        labelText: 'Имя',
        hintText: 'Введите имя',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: 'assets/icons/User.svg',
        ),
      ),
    );
  }
}
