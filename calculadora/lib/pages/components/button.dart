import 'package:calculadora/interface/interface_button.dart';
import 'package:flutter/material.dart';
import 'package:calculadora/pages/color/colors.dart';
import 'package:calculadora/service/logica.dart';
import 'package:calculadora/service/implementacao/logica_imp.dart';
import 'package:calculadora/pages/components/color_controller/controller_color.dart';
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

class _ButtonState extends State<Button> implements ButtonLyrics {
 final Controller controllerColor = Controller();
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
        onTap: () => setState(() => uploadLyrics()),
        child: Center(
          child: Text(
            widget.label,
            style: TextStyle(
              color:  controllerColor.verificarParaMudarCorText(widget.label),
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
  @override
  String uploadLyrics() {
    String label = widget.label;
    switch (label) {
      case "CE":
        widget.controller.clear();
        widget.onExpressao("");
        break;
      case "C":
        if (widget.controller.text.isNotEmpty) {
          widget.controller.text = widget.controller.text.substring(
            0,
            widget.controller.text.length - 1,
          );
        }
        break;
      case "+/-":
        if (widget.controller.text.isNotEmpty) {
          if (widget.controller.text.startsWith('-')) {
            widget.controller.text = widget.controller.text.substring(1);
          } else {
            widget.controller.text = '-${widget.controller.text}';
          }
          break;
        }
      case "=":
        try {
          widget.onExpressao(widget.controller.text.toString());
             var contexto;
            if(widget.controller.text.toString().startsWith('-')){
              contexto = Logica(BlibiotecaExterna());
               widget.controller.text = contexto.executar(widget.controller.text.toString());
            }else{
                 contexto = Logica(CalculoInterno());
               widget.controller.text = contexto.executar(widget.controller.text.toString());
            }
        
        } catch (e) {
          widget.controller.text = "$e";
        }
        break;
      default:
        widget.controller.text += label;
    }
    return label;
  }

  
}
