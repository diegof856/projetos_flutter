import 'package:calculadora/interface/strategy.dart';
import 'package:calculadora/interface/interface_button.dart';
import 'package:calculadora/service/implementacao/logica_imp.dart';
import 'package:flutter/material.dart';

class Logica {
 Calculo _calculo;
 Logica(this._calculo);
 

  String executar(String expressao){
  return _calculo.calcular(expressao);
 }
 
}
class Service implements ButtonLyrics{
 @override
  String uploadLyrics(String label, TextEditingController controller , void Function(String expressao) onExpressao) {
   
    switch (label) {
      case "CE":
       controller.clear();
       onExpressao("");
        break;
      case "C":
        if (controller.text.isNotEmpty) {
          controller.text = controller.text.substring(
            0,
            controller.text.length - 1,
          );
        }
        break;
      case "+/-":
        if (controller.text.isNotEmpty) {
          if (controller.text.startsWith('-')) {
            controller.text = controller.text.substring(1);
          } else {
           controller.text = '-${controller.text}';
          }
          break;
        }
      case "=":
        try {
          onExpressao(controller.text.toString());
          var contexto;
          controller.text = controller.text.replaceAll(',', '.');
          if (controller.text.toString().startsWith('-')) {
            contexto = Logica(BlibiotecaExterna());
            controller.text = contexto.executar(
            controller.text.toString(),
            );
          } else {
            contexto = Logica(CalculoInterno());
            controller.text = contexto.executar(
            controller.text.toString(),
            );
          }
        } catch (e) {
          controller.text = "$e";
        }
        break;
      default:
       controller.text += label;
    }
    return label;
  }
}

