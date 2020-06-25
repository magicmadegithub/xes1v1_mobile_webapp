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
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
      );

  static TextStyle get menu_item => TextStyle(
        fontSize: 16.0,
        letterSpacing: 1.0,
        color: Colors.black,
      );

  static TextStyle get text1 => TextStyle(
        fontSize: 16.0,
        letterSpacing: 1.0,
        color: Colors.black,
        fontStyle: FontStyle.italic,
      );

  static TextStyle get text2 => TextStyle(
      fontSize: 16.0,
      letterSpacing: 1.0,
      color: Colors.red,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold);

  static TextStyle get articleTitle => TextStyle(
        fontSize: 24.0,
      );

  static TextStyle get articleContent =>
      TextStyle(fontSize: 15.0, color: Color(0xFF333333));

  static TextStyle get articleTime =>
      TextStyle(fontSize: 15.0, color: Color(0xFF757575));

  static TextStyle get articleTag => TextStyle(
        fontSize: 15.0,
        fontStyle: FontStyle.italic,
        color: Color(0xFF757575),
      );

  static TextStyle get articleReadAll => TextStyle(
    fontSize: 15.0,
    color: Colors.red,
  );

  static TextStyle get linkText => TextStyle(
    fontSize: 13.0,
    color: Colors.red,
  );
}
