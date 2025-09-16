import 'package:calculadora/pages/color/colors.dart';
import 'package:flutter/material.dart';
class Controller {
   //Controles de cores
  Color verificarParaMudarCorText(String text) {
    if (text == "CE") {
      return CoresCustomizadas.corTextoCE;
    } else if (["/", "-", "*", "+", "="].contains(text)) {
      return CoresCustomizadas.corTextoOperador;
    } else {
      return CoresCustomizadas.corInput;
    }
  }

  LinearGradient verificarParaMudarCorBtn(String text) {
    if (["/", "-", "*", "+"].contains(text)) {
      return LinearGradient(
        colors: [
          CoresCustomizadas.corOperadorOpaco,
          CoresCustomizadas.corOperador,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    } else if (text == "=") {
      return LinearGradient(
        colors: [
          CoresCustomizadas.corBtnsIgualdadeOpaco,
          CoresCustomizadas.corBtnsIgualdade,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    } else {
      return LinearGradient(
        colors: [
          CoresCustomizadas.corPrincipalOpaco,
          CoresCustomizadas.corPrincipal,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    }
  }
  //Controles de cores

}