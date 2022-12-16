import 'package:flutter/material.dart';
import 'package:verification_code_field/src/theme/colors.dart';

class CellTheme {
  final double? height;
  final double? width;
  final double? borderWidth;
  final Color? borderColor;
  final Color? backgroundColor;
  final TextStyle? textStyle;

  CellTheme({
    this.borderColor,
    this.backgroundColor,
    this.textStyle,
    this.height,
    this.width,
    this.borderWidth,
  });
}

class DefaultCellTheme extends CellTheme {
  DefaultCellTheme()
      : super(
          height: 50,
          width: 40,
          backgroundColor: backgroundColor,
          borderColor: primaryColor,
          textStyle: const TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        );
}
