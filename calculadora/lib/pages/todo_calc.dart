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
  final TextEditingController _controller = TextEditingController();
  String expressao = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoresCustomizadas.corPrincipal,
      body:  Column(
        children: [
          Expanded(
              flex: 2,
              child: Inputs(
              controller:_controller,
              expressao:expressao)
          ),
          Expanded(
              flex: 8,
              child: Buttons(
              controller:_controller,
               onExpressao: (expr) {
                setState(() {
                  expressao = expr; 
                });
                },
                ),
          ),
        ],
      ),
    );
  }
}
