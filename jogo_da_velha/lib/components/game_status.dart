import 'package:flutter/material.dart';
import 'package:flutter_application_1/main_color.dart';

class GameStatus extends StatelessWidget {
  final String result;
  final bool oTurn;
  final int seconds;
  final int tentativas;
  final Function()resetarTabuleiro;
  const GameStatus({
    super.key,
    required this.result,
    required this.oTurn,
    required this.seconds,
    required this.tentativas,
    required this.resetarTabuleiro
  });

  Widget _construirCronometro() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Vez do jogador ' + (oTurn ? "O" : "X"),
          style: MainColor.customFontWhite,
        ),
        Text('Tempo restante', style: MainColor.customFontWhite),
        const SizedBox(height: 10),
        Text(seconds.toString(), style: MainColor.customFontWhite),
        SizedBox(height: 15,),
        if (tentativas>0) btnRetorno(),
      ],
    );
  }
  Widget btnRetorno(){
 return   ElevatedButton(
          onPressed: resetarTabuleiro,
          style: ElevatedButton.styleFrom(
            backgroundColor: MainColor.secondaryColor,
            padding: EdgeInsets.zero,
          ),
          child: Icon(
            Icons.refresh,
            size: 50,
          ),
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
