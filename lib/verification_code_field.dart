library verification_code_field;

import 'package:flutter/material.dart';
import 'package:verification_code_field/src/models/cell_theme.dart';
import 'package:verification_code_field/src/widgets/cell.dart';

export 'package:verification_code_field/src/models/cell_theme.dart';

const _maxLength = 4;

class VerificationCodeField extends StatefulWidget {
  /// Code length
  ///
  /// Default value is 4
  final int length;

  /// Function to be called when fields are filled
  final VoidCallback? onSubmit;

  /// Whether automatically focus on field or not
  ///
  /// Default value is true
  final bool autofocus;

  /// Controls the theme of each [Cell]
  ///
  /// If null [DefaultCellTheme] will be used
  final CellTheme? cellTheme;

  /// Custom header widget
  ///
  /// Will be placed above the [VerificationCodeField]
  final Widget? header;

  /// Whether field is enabled ot not
  ///
  /// Default value is [true]
  final bool? enabled;

  /// Whether to show the indicator or not
  ///
  /// Default value is [true]
  final bool showFocusIndicator;

  /// Whether to blink the indicator or not
  ///
  /// [showFocusIndicator] should be [true]
  /// Default value is [true]
  final bool blinkFocusIndicator;

  /// Decides what type of keyboard should be displayed
  ///
  /// Default value is [TextInputType.number]
  final TextInputType? keyboardType;

  /// A [FocusNode] for managing focus on field
  final FocusNode? focusNode;

  const VerificationCodeField({
    super.key,
    this.length = _maxLength,
    required this.onSubmit,
    this.autofocus = true,
    this.enabled = true,
    this.keyboardType,
    this.focusNode,
    this.header,
    this.cellTheme,
    this.showFocusIndicator = true,
    this.blinkFocusIndicator = true,
  });

  @override
  State<VerificationCodeField> createState() => _VerificationCodeFieldState();
}

class _VerificationCodeFieldState extends State<VerificationCodeField> {
  List<String> code = [];
  late final maxCodeLength = widget.length;

  late final _focusNode = widget.focusNode ?? FocusNode();

  void onCodeChanged(value) {
    setState(() => code = value.split(''));
    if (value.length == maxCodeLength) {
      FocusScope.of(context).unfocus();
      widget.onSubmit != null ? widget.onSubmit!() : null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        // Hide text field
        Visibility(
          visible: false,
          maintainState: true,
          maintainInteractivity: true,
          maintainSize: true,
          maintainAnimation: true,
          child: TextField(
            autofocus: widget.autofocus,
            enabled: widget.enabled,
            keyboardType: widget.keyboardType ?? TextInputType.number,
            maxLength: maxCodeLength,
            focusNode: _focusNode,
            onChanged: onCodeChanged,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.header != null) widget.header!,
            GestureDetector(
              onTap: _focusNode.requestFocus,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List<Widget>.generate(
                  maxCodeLength,
                  (index) {
                    final isFilled = index < code.length;
                    final isFocused =
                        index == code.length && _focusNode.hasFocus;
                    return Cell(
                      key: UniqueKey(),
                      isFilled: isFilled,
                      theme: widget.cellTheme ?? CellTheme(),
                      isFocused: isFocused,
                      showFocusIndicator:
                          widget.showFocusIndicator && isFocused,
                      blinkFocusIndicator: widget.blinkFocusIndicator,
                      value: isFilled ? code[index] : null,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
