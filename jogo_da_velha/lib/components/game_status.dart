import 'package:flutter/material.dart';
import 'package:flutter_application_1/main_color.dart';
class GameStatus extends StatelessWidget {
  final String result;
  final bool oTurn;
  final int seconds;
  const GameStatus({
    super.key,
    required this.result,
    required this.oTurn,
    required this.seconds
  });

  Widget _construirCronometro() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Vez do jogador ' + (oTurn ? "O" : "X"),
            style: MainColor.customFontWhite
        ),
        Text(
          'Tempo restante',
          style: MainColor.customFontWhite,
        ),
        const SizedBox(height: 10),
        Text(
          seconds.toString(),
          style: MainColor.customFontWhite,
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              result, style: MainColor.customFontWhite),
          const SizedBox(height: 10,),
          _construirCronometro()
        ],
      ),
    );
  }
}
