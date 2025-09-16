import 'package:calculadora/interface/strategy.dart';
import 'package:expressions/expressions.dart';

class BlibiotecaExterna implements Calculo {
  @override
  String calcular(String expressao) {
    final parsed = Expression.parse(expressao);
    final evaluator = const ExpressionEvaluator();
    final resultado = evaluator.eval(parsed, {});
  
    if(resultado.isInfinite){
     throw ("Divisão por zero");
    }
    if (resultado is num) {
      return resultado.toDouble().toString();
    }
   
    throw ("Erro");
  }
}

class CalculoInterno implements Calculo {
  @override
  String calcular(String expressao) {
    double resultado = _calculate(expressao);
    return resultado.toString();
  }

  double _calculate(String expr) {
  
    List<String> operadores = [];
    List<double> valores = [];
    //expressão regular
    RegExp invalid = RegExp(r'(^[\+\*/%])|([\+\-\*\/%]{2,})|([\+\-\*\/%]$)');
    RegExp opRegex = RegExp(r'[\+\-\*\/%]');

    if (invalid.hasMatch(expr)) {
      throw "Erro";
    }

    for (var part in expr.split('')) {
      if (opRegex.hasMatch(part)) {
        operadores.add(part);
      }
    }
    valores = expr.split(opRegex).map((e) => double.parse(e.trim())).toList();

    multiplicacaoDivisao(operadores, valores);
    
    
    return somaSubtracao(operadores, valores);
  }

  void multiplicacaoDivisao(List<String> operadores, List<double> valores){
        for (int i = 0; i < operadores.length; i++) {
      if (operadores[i] == '*' ||
          operadores[i] == '/' ||
          operadores[i] == '%') {
        double valorA = valores[i];
        double valorB = valores[i + 1];
        if ((operadores[i] == '/' || operadores[i] == '%') && valorB == 0) {
          throw (operadores[i] == '/' ? "Divisão por zero" : 'Módulo por zero');
        }
        double res = operadores[i] == '*'
            ? valorA * valorB
            : operadores[i] == '/'
            ? valorA / valorB
            : valorA % valorB;
        valores[i] = res;
        valores.removeAt(i + 1);
        operadores.removeAt(i);
        i--;
      }
    }
  }
  double somaSubtracao(List<String> operadores, List<double> valores){
    double resultado = valores[0];
    for (int i = 0; i < operadores.length; i++) {
      if (operadores[i] == '+') {
        resultado += valores[i + 1];
      } else if (operadores[i] == '-') {
        resultado -= valores[i + 1];
      }
    }
    return resultado;
  }
}
