import 'package:flutter/material.dart';
import 'package:calculadora/pages/color/colors.dart';

class Inputs extends StatefulWidget {
  final TextEditingController controller;
  final String expressao;
  Inputs({super.key, required this.controller, required this.expressao});

  @override
  State<Inputs> createState() => _Inputs();
}

class _Inputs extends State<Inputs> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            widget.expressao,
            style: TextStyle(
              color: CoresCustomizadas.corSecundaria,
              fontSize: 20,
            ),
            textAlign: TextAlign.right,
          ),
          TextField(
            style: TextStyle(color: CoresCustomizadas.corInput, fontSize: 32),
            controller: widget.controller,
            textAlign: TextAlign.right,
            readOnly: true,
            decoration: InputDecoration(
              hintText: "Ex:3*2+5",
              hintStyle: TextStyle(color: CoresCustomizadas.corSecundaria),
              border: InputBorder.none,
              prefix: Text(
                '=',
                style: TextStyle(
                  color: CoresCustomizadas.corSecundaria,
                  fontSize: 36,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
