import 'package:calculadora/interface/strategy.dart';
class Logica {
 Calculo _calculo;
 Logica(this._calculo);

  String executar(String expressao){
  return _calculo.calcular(expressao);
 }

}
