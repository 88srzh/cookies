import 'package:flutter/material.dart';

class CustomInputDecoration {
  static InputDecoration textFieldStyle({
    String labelTextStr = '',
    String hintTextStr = '',
  }) {
    return textFieldStyle(
      // contentPadding: EdgeInsets.all(12),
      labelTextStr: labelTextStr,
      hintTextStr: hintTextStr,
      // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
