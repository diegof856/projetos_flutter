import 'package:calculadora/pages/interface/interface_button.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> implements ButtonLyrics{
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: uploadLyrics,
        style: TextButton.styleFrom(
          backgroundColor: Color(0xFF2D2A37),
          fixedSize: const Size(100, 100),
          shape: CircleBorder(
            side: BorderSide(color: Colors.white)
          )
        ),
        child: Text(
            "CE",
        style: TextStyle(
            color: Color(0xFF975DFA),
          fontSize: 24
        ),
        )
    );
  }

  @override
  String uploadLyrics() {

    return "CE";
  }
}
