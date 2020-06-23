import 'package:flutter/material.dart';


class TextStyles {
  TextStyles._();

  static TextStyle get logo1 => TextStyle(
        color: Colors.red,
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
      );

  static TextStyle get logo2 => TextStyle(
        color: Color(0xFF45405B),
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
      );

  static TextStyle get menu_item => TextStyle(
        fontSize: 16.0,
        letterSpacing: 1.0,
        color: Colors.black,
      );
}
