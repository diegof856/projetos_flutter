import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              data,
              style: TextStyle(color: Color(0xFF6B6B6B)),
              textAlign: TextAlign.right
            )
            ,
            TextField(
              style: TextStyle(color: const Color(0xFFEBEBEB)),
              controller: widget.inputController,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                  hintText: "Ex:3*2+5",
                  hintStyle: TextStyle(color: Color(0xFF6B6B6B)),
                  border: InputBorder.none,
                  prefix: Text(
                    '=',
                    style: TextStyle(
                      color: Color(0xFFEBEBEB),
                    ),
                  )
              ),
            )
          ],
        ),
    );

  }
}


