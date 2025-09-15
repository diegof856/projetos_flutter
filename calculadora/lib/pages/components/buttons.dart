import 'package:flutter/material.dart';
import 'package:calculadora/pages/components/line_button.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      LineButton(),
        LineButton(),
        LineButton(),
        LineButton(),
         LineButton()

      ],
    );
  }
}
