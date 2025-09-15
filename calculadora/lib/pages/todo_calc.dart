import 'package:flutter/material.dart';
import 'package:calculadora/pages/components/inputs.dart';
import 'package:calculadora/pages/components/buttons.dart';
import 'package:calculadora/pages/color/colors.dart';
class TodoCalc extends StatefulWidget {
  const TodoCalc({super.key});

  @override
  State<TodoCalc> createState() => _TodoCalcState();
}

class _TodoCalcState extends State<TodoCalc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoresCustomizadas.corPrincipal,
      body:Padding(
        padding: const EdgeInsets.all(24),
         child:  Column(
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
      ),
      )
    );
  }
}
