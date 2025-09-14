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

  int oScore = 0;
  int xScore = 0;

  String resultDeclaration = '';

  static const maxSeconds = 30;
  int seconds = maxSeconds;
  Timer? timer;

  void startTimer(){
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if(seconds > 0) {
          seconds--;
        } else {
          stopTimer();
          oTurn = oTurn == true?false:true;
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

  void _marcacao(int linha, int coluna, int index){

    if (displayXO[linha][coluna] != '') {
      return; // Posição já preenchida
    }
    stopTimer();
    setState(() {
      if (oTurn) {
        displayXO[linha][coluna] = "O";
      } else {
        displayXO[linha][coluna] = "X";
      }

      oTurn = !oTurn;
      if(!_checarVitoria()){
        _verificarEmpate(index);
      }
    });
  }
  void _verificarEmpate(int index){
    if(!matchedIndexes.contains(index)){
      matchedIndexes.add(index);
    }
    if(matchedIndexes.length == 9){
      setState(() {
        resultDeclaration = "Empate";
      });
      _resetarTabuleiro();
    }

  }

  bool _checarVitoria() {
    // Checar linhas(horizontal)
    for (int i = 0; i < 3; i++) {
      if (displayXO[i][0] == displayXO[i][1] && displayXO[i][0] == displayXO[i][2] && displayXO[i][0] != '') {
        _declararVitoria( displayXO[i][0]);
        return true;
      }
    }

    // Checar colunas (vertical)
    for (int i = 0; i < 3; i++) {
      if (displayXO[0][i] == displayXO[1][i] && displayXO[0][i] == displayXO[2][i] && displayXO[0][i] != '') {
        _declararVitoria(displayXO[0][i]);
        return true;
      }
    }

    // Checar diagonal (principal)
    if (displayXO[0][0] == displayXO[1][1] && displayXO[0][0] == displayXO[2][2] && displayXO[0][0] != '') {
      _declararVitoria(displayXO[0][0]);
      return true;
    }
    // Checar diagonal (secundaria)
    if (displayXO[0][2] == displayXO[1][1] && displayXO[0][2] == displayXO[2][0] && displayXO[0][2] != '') {
      _declararVitoria(displayXO[0][2]);
      return true;
    }
    return false;
  }
  void _declararVitoria(String vencedor) {
    setState(() {
      if (vencedor == 'X') {
        xScore++;
      } else {
        oScore++;
      }
      resultDeclaration = "Jogador $vencedor venceu";
    });
    _resetarTabuleiro();
  }
  void _resetarTabuleiro() {
    setState(() {
      displayXO = [
        ['', '', ''],
        ['', '', ''],
        ['', '', '']
      ];
      matchedIndexes.clear();
      stopTimer();
      oTurn = true;
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
                (linha,coluna,index){
                  _marcacao(linha, coluna, index);
                  startTimer();
                }),
          ),
          Expanded(flex: 2, child:GameStatus(result: resultDeclaration, oTurn: oTurn, seconds: seconds))
        ],
      ),
      ),
   );
  }

}