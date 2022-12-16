import 'package:flutter/material.dart';
import 'package:verification_code_field/src/theme/colors.dart' as colors;

class CellTheme {
  final double height;
  final double width;
  final double borderWidth;
  final Color borderColor;
  final Color backgroundColor;
  final TextStyle textStyle;

  CellTheme({
    this.height = 50,
    this.width = 40,
    this.borderWidth = 1,
    this.borderColor = colors.primaryColor,
    this.backgroundColor = colors.backgroundColor,
    this.textStyle = const TextStyle(
      color: colors.primaryColor,
      fontWeight: FontWeight.bold,
    ),
  });
}
