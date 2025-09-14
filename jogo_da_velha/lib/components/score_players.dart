import 'package:flutter/material.dart';
import 'package:flutter_application_1/main_color.dart';

class ScorePlayers extends StatelessWidget {
  final int oScore;
  final int xScore;

  const ScorePlayers({
    super.key,
    required this.oScore,
    required this.xScore,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Player O',
              style: MainColor.customFontWhite,
            ),
            Text(
              oScore.toString(),
              style: MainColor.customFontWhite,
            ),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Player X',
              style: MainColor.customFontWhite,
            ),
            Text(
              xScore.toString(),
              style: MainColor.customFontWhite,
            ),
          ],
        ),
      ],
    );
  }
}
