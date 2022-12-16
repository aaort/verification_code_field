// Default values

import 'package:flutter/material.dart';
import 'package:verification_code_field/src/models/cell_theme.dart';
import 'package:verification_code_field/src/widgets/blinker.dart';

// Cell border radius
const _borderRadius = 7.0;
// Default filled cell color

class Cell extends StatelessWidget {
  final bool isFocused;

  final String? value;
  final CellTheme theme;
  final bool showFocusIndicator;
  final bool blinkFocusIndicator;

  const Cell({
    super.key,
    required this.isFocused,
    required this.value,
    required this.theme,
    required this.showFocusIndicator,
    required this.blinkFocusIndicator,
  });

  @override
  Widget build(BuildContext context) {
    final cellTextStyle = Theme.of(context).textTheme.headline6!;
    return Container(
      width: theme.width,
      height: theme.height,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        border: Border.all(
          color: theme.borderColor,
          width: theme.borderWidth,
        ),
        color: theme.backgroundColor,
      ),
      child: showFocusIndicator && value == null
          ? Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Blinker(
                color: theme.borderColor,
                blink: blinkFocusIndicator,
              ),
            )
          : Center(
              child: Text(
                value ?? ' ',
                style: cellTextStyle.merge(theme.textStyle),
              ),
            ),
    );
  }
}
