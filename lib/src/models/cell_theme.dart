import 'package:flutter/material.dart';

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

  /// Creates a [CellTheme] dependent on defined [Theme.of(context)] object
  ///
  /// [borderColor] is [Theme.of(context).primaryColor]
  /// [backgroundColor] is [Theme.of(context).backgroundColor]
  factory CellTheme.fromTheme(BuildContext context) {
    final theme = Theme.of(context);
    return CellTheme(
      backgroundColor: theme.backgroundColor,
      borderColor: theme.primaryColor,
    );
  }
}
