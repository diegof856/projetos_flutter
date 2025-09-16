import 'package:flutter/material.dart';
import 'package:calculadora/pages/color/colors.dart';
import 'package:calculadora/pages/components/color_controller/controller_color.dart';
import 'package:calculadora/service/service.dart';
class Button extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final void Function(String expressao) onExpressao;
  const Button({
    super.key,
    required this.label,
    required this.controller,
    required this.onExpressao,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  final Controller controllerColor = Controller();
  final Service service = Service();
  //widgets
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: controllerColor.verificarParaMudarCorBtn(widget.label),
        border: Border.all(color: CoresCustomizadas.corInputOpaca),
        boxShadow: criarSombra(),
      ),
      child: criarMaterial(),
    );
  }

  Material criarMaterial() {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () => setState(() => service.uploadLyrics(widget.label,widget.controller,widget.onExpressao)),
        child: Container(
          width: 64,
          height: 64,
          alignment: Alignment.center,
          color: Colors.transparent,
          child: Text(
            widget.label,
            style: TextStyle(
              color: controllerColor.verificarParaMudarCorText(widget.label),
              fontSize: 32,
            ),
          ),
        ),
      ),
    );
  }

  List<BoxShadow> criarSombra() {
    return [
      BoxShadow(
        color: CoresCustomizadas.corSombra,
        offset: const Offset(2, 2),
        blurRadius: 9,
      ),
    ];
  }

  //widgets//

}
