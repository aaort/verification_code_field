import 'package:flutter/material.dart';
import 'package:verification_code_field/src/models/cell_theme.dart';
import 'package:verification_code_field/src/widgets/blinker.dart';

/// Single cell in [CodeVerificationField] group of cells
class Cell extends StatelessWidget {
  /// Is this is a currently focused cell
  final bool isFocused;

  /// Value of each cell
  final String? value;

  /// Controls the look of each cell
  final CellTheme theme;

  /// Whether to show a focus indicator or not
  final bool showFocusIndicator;

  /// Whether to blink focus Indicator or not
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
    return Container(
      width: theme.width,
      height: theme.height,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(theme.borderRadius),
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
                style: theme.textStyle,
              ),
            ),
    );
  }
}
