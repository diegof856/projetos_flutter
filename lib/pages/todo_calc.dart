import 'package:flutter/material.dart';
import 'package:calculadora/pages/components/inputs.dart';
import 'package:calculadora/pages/components/buttons.dart';
class TodoCalc extends StatefulWidget {
  const TodoCalc({super.key});

  @override
  State<TodoCalc> createState() => _TodoCalcState();
}

class _TodoCalcState extends State<TodoCalc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2A37),
      body:Column(
        children: [
          Expanded(
              flex: 2,
              child: Inputs()
          ),
          Expanded(
              flex: 8,
              child: Buttons()
          ),
        ],
      )
    );
  }
}
