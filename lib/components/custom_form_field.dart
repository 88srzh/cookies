import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatefulWidget {
  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  get controller => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8), vertical: getProportionateScreenWidth(16)),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: controller,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
        ),
      ],
    );
  }
}
