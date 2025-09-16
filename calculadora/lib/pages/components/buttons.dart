import 'package:flutter/material.dart';

import 'package:calculadora/pages/components/button.dart';


class Buttons extends StatefulWidget {
   final TextEditingController controller;
   final void Function(String resultado) onExpressao;
  const Buttons({
    super.key,
    required this.controller,
    required this.onExpressao
     });

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {


    final List<List<String>> display = [
    ['CE', 'C', '%', '/'],
    ['7', '8', '9', '*'],
    ['4', '5', '6', '-'],
    ['1', '2', '3', '+'],
    ['+/-', '0', ',', '='],
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: display.map((linha) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: linha.map((text) {
              return Expanded(
                child: Button(label: text, controller: widget.controller, onExpressao: widget.onExpressao,),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
  }

