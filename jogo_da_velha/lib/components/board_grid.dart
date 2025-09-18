import 'package:flutter/material.dart';
import 'package:flutter_application_1/main_color.dart';
import 'package:google_fonts/google_fonts.dart';

class BoardGrid extends StatelessWidget {
  final bool oTurn;
  final List<List<String>> displayXO;
  final List<int> matchedIndexes;
  final Function(int linha, int coluna) onTapCell;
  const BoardGrid({
     super.key,
     required this.displayXO,
     required this.matchedIndexes,
     required this.oTurn,
     required this.onTapCell
   });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          int linha = index ~/ 3;
          int coluna = index % 3;
          return GestureDetector(
            onTap: () => onTapCell(linha,coluna),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 5,
                    color: MainColor.primaryColor,
                  ),
                  color: matchedIndexes.contains(index)
                      ? MainColor.accentColor
                      : MainColor.secondaryColor
              ),
              child: Center(
                child: Text(
                  displayXO[linha][coluna],
                  style: GoogleFonts.coiny(textStyle: TextStyle(
                      fontSize: 70,
                      color: matchedIndexes.contains(index)
                          ? MainColor.secondaryColor
                          : MainColor.primaryColor
                  )),
                ),
              ),
            ),
          );
        }
    );
  }
}


