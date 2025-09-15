import 'package:flutter/material.dart';
import 'package:calculadora/pages/components/button.dart';
class LineButton extends StatefulWidget {
  const LineButton({super.key});

  @override
  State<LineButton> createState() => _LineButtonState();
}

class _LineButtonState extends State<LineButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
     child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Button()
        ),
        Expanded(
            child: Button()
        ), Expanded(
            child: Button()
        ), Expanded(
            child: Button()
        ),
        
      ],
    )
    );
  }
}
