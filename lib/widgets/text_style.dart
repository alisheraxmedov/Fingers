import 'package:fingerprint/consts/colors.dart';
import 'package:flutter/material.dart';

class TextStylesClass {
  static TextStyle normalStyle({
    required double size,
    double spacing = 1.0,
  }) {
    return TextStyle(
      fontFamily: "Sumana",
      fontSize: size,
      letterSpacing: spacing,
      color: ColorsClass.grey,
    );
  }

  static TextStyle boldBigStyle({
    required double size,
    double spacing = 1.0,
  }) {
    return TextStyle(
      fontFamily: "Sumana",
      fontSize: size,
      fontWeight: FontWeight.bold,
      letterSpacing: spacing,
    );
  }

  static TextStyle boldStyle({
    required double size,
    double spacing = 1.0,
  }) {
    return TextStyle(
      fontFamily: "Sumana",
      fontSize: size,
      letterSpacing: spacing,
    );
  }
}
