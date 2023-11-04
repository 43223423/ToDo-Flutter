import 'package:flutter/material.dart';
import 'package:string_to_color/string_to_color.dart';
import 'dart:ui';

class ButtonColor extends StatefulWidget {
  final Color cor;

  VoidCallback onPressed;

  ButtonColor({required this.cor, required this.onPressed});

  State<ButtonColor> createState() => _ButtonColor();
}

class _ButtonColor extends State<ButtonColor> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: Text(""),
        style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(23),
            backgroundColor: widget.cor,
            side: BorderSide(width: 2, color: Colors.white)),
      ),
    );
  }
}
