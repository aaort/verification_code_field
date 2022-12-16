import 'package:flutter/material.dart';
import 'package:verification_code_field/src/theme/colors.dart' as colors;

// Default values
part './constants.dart';

class CellTheme {
  final double height;
  final double width;
  final double borderWidth;
  final Color borderColor;
  final double borderRadius;
  final Color backgroundColor;
  final TextStyle textStyle;

  CellTheme({
    this.height = _height,
    this.width = _width,
    this.borderWidth = _borderWidth,
    this.borderColor = _borderColor,
    this.borderRadius = _borderRadius,
    this.backgroundColor = _backgroundColor,
    this.textStyle = _textStyle,
  });
}
