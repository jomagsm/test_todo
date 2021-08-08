import 'package:flutter/material.dart';
import 'package:test_todo/theme/color_theme.dart';

class TextThemes {
  static var hintText = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ColorPalette.outlinedBorder);

  static var buttonStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: ColorPalette.outlinedBorder);
  
  static var inputText = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ColorPalette.white);
  
   static var errorText = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ColorPalette.red);
}
