// Default values

import 'package:flutter/material.dart';
import 'package:verification_code_field/src/models/cell_theme.dart';

const _cellWidth = 40.0;
const _cellHeight = 50.0;
// Cell border radius
const _borderRadius = 7.0;
// Default filled cell color

class Cell extends StatelessWidget {
  final bool isFocused;
  final bool isFilled;
  final String? value;
  final CellTheme? theme;

  const Cell({
    super.key,
    required this.isFocused,
    required this.isFilled,
    required this.value,
    this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.background;
    final cellTextStyle = Theme.of(context).textTheme.headline6!;
    return Container(
      width: theme?.width ?? _cellWidth,
      height: theme?.height ?? _cellHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        border: Border.all(
          color: theme?.borderColor ?? Colors.transparent,
          width: theme?.borderWidth ?? 1,
        ),
        color: theme?.backgroundColor ?? backgroundColor,
      ),
      child: Center(
        child: Text(
          isFilled ? value! : ' ',
          style: cellTextStyle.merge(theme?.textStyle),
        ),
      ),
    );
  }
}
