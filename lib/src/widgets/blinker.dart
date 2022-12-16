import 'dart:async';

import 'package:flutter/material.dart';

class Blinker extends StatefulWidget {
  final Color color;
  final bool blink;

  const Blinker({super.key, required this.color, this.blink = true});

  @override
  State<Blinker> createState() => _BlinkerState();
}

class _BlinkerState extends State<Blinker> {
  bool visible = true;
  Timer? timer;

  @override
  void initState() {
    // Do not add timer if blink is false
    if (widget.blink) {
      timer = Timer.periodic(const Duration(milliseconds: 500), (_) {
        setState(() => visible = !visible);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: SizedBox(
        height: 2,
        width: 15,
        child: ColoredBox(color: widget.color),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
