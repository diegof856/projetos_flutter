import 'package:flutter/material.dart';
import 'package:calculadora/pages/color/colors.dart';
class Inputs extends StatefulWidget {
  Inputs ({super.key});
  final TextEditingController inputController = TextEditingController();
  @override
  State<Inputs> createState() => _Inputs();
}

class _Inputs extends State<Inputs> {
  String data = "ddqdqw";
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              data,
              style: TextStyle(
                color: CoresCustomizadas.corSecundaria,
                fontSize: 20),
              textAlign: TextAlign.right
            )
            ,
            TextField(
              style: TextStyle(
                color: CoresCustomizadas.corInput,
                fontSize: 36),
              controller: widget.inputController,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                  hintText: "Ex:3*2+5",
                  hintStyle: TextStyle(color: CoresCustomizadas.corSecundaria),
                  border: InputBorder.none,
                  prefix: Text(
                    '=',
                    style: TextStyle(
                      color: CoresCustomizadas.corSecundaria,
                      fontSize: 36
                    ),
                  )
              ),
            )
          ],
        )
    );
   

  }
}


