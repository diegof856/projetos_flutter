import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main_color.dart';

import 'package:flutter_application_1/components/score_players.dart';
import 'package:flutter_application_1/components/board_grid.dart';
import 'package:flutter_application_1/components/game_status.dart';
class TictactoePage extends StatefulWidget {
  const TictactoePage({super.key});

  @override
  State<TictactoePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TictactoePage> {
  bool oTurn = true;
  List<List<String>> displayXO = [
    ['', '', ''],
    ['', '', ''],
    ['', '', '']
  ];
  List<int> matchedIndexes = [];
  bool condicaoVitoria = false;
  int tentativas = 0; 
  int oScore = 0;
  int xScore = 0;

  String resultDeclaration = '';

  static const maxSeconds = 30;
  int seconds = maxSeconds;
  Timer? timer;

  void startTimer(){
    stopTimer();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if(seconds > 0 && !condicaoVitoria) {
          seconds--;
        }else if(condicaoVitoria){
          stopTimer();
        }else{
          stopTimer();
          oTurn = oTurn?false:true;
          startTimer();
        }
      });
    });
  }

  void stopTimer() {
    resetTimer();
    timer?.cancel();
  }

  void resetTimer() => seconds = maxSeconds;

  void _marcacao(int linha, int coluna){
    startTimer();
    if (displayXO[linha][coluna] != '') {
      return; // Posição já preenchida
    }
    
    setState(() {
      if (oTurn) {
        displayXO[linha][coluna] = "O";
      } else {
        displayXO[linha][coluna] = "X";
      }
      tentativas++;
      oTurn = !oTurn;
      condicaoVitoria = _checarVitoria();
     
      if(!condicaoVitoria){
        _verificarEmpate();
      }
     
    });

  }
  void _verificarEmpate(){
    if(tentativas == 9 && !condicaoVitoria){
      setState(() {
        resultDeclaration = "Empate";
        matchedIndexes = List.generate(9, (index) => index);
        condicaoVitoria = true;
      });
      stopTimer();
    }

  }

  bool _checarVitoria() {
    // Checar linhas(horizontal)
    for (int i = 0; i < 3; i++) {
      if (displayXO[i][0] == displayXO[i][1] && displayXO[i][0] == displayXO[i][2] && displayXO[i][0] != '') {
        _declararVitoria( displayXO[i][0], [i * 3, i * 3 + 1, i * 3 + 2] );
        return true;
      }
    }

    // Checar colunas (vertical)
    for (int i = 0; i < 3; i++) {
      if (displayXO[0][i] == displayXO[1][i] && displayXO[0][i] == displayXO[2][i] && displayXO[0][i] != '') {
         _declararVitoria(displayXO[0][i], [i, i + 3, i + 6]);
        return true;
      }
    }

    // Checar diagonal (principal)
    if (displayXO[0][0] == displayXO[1][1] && displayXO[0][0] == displayXO[2][2] && displayXO[0][0] != '') {
        _declararVitoria(displayXO[0][0], [0, 4, 8]);
      return true;
    }
    // Checar diagonal (secundaria)
    if (displayXO[0][2] == displayXO[1][1] && displayXO[0][2] == displayXO[2][0] && displayXO[0][2] != '') {
        _declararVitoria(displayXO[0][2],  [2, 4, 6]);
      return true;
    }
    return false;
  }
  void _declararVitoria(String vencedor, List<int> indices) {
    setState(() {
      matchedIndexes = indices;
      if (vencedor == 'X') {
        xScore++;
      } else {
        oScore++;
      }
      resultDeclaration = "Jogador $vencedor venceu";
    });
  }
  void resetarTabuleiro() {
    setState(() {
      displayXO = [
        ['', '', ''],
        ['', '', ''],
        ['', '', '']
      ];
      matchedIndexes.clear();
      stopTimer();
      tentativas = 0;         
      condicaoVitoria = false;
      oTurn = true;
      resultDeclaration ='';
    });
  }

  @override
  Widget build(BuildContext context) {

   return Scaffold(
    backgroundColor: MainColor.primaryColor,
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: ScorePlayers(oScore: oScore, xScore: xScore)),
          Expanded(
            flex: 3,
            child: BoardGrid(
                displayXO: displayXO,
                matchedIndexes: matchedIndexes,
                oTurn: oTurn, onTapCell:
                (linha,coluna){
                  _marcacao(linha, coluna);
                  
                }),
          ),
         
          Expanded(flex: 2, child:GameStatus(result: resultDeclaration, oTurn: oTurn, seconds: seconds,  tentativas: tentativas, resetarTabuleiro:resetarTabuleiro))
        ],
      ),
      ),
   );
  }

}