import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainColor {
  static Color primaryColor = const Color.fromARGB(255, 27, 73, 224);
  static Color secondaryColor = const Color.fromARGB(255, 255, 255, 255);
  static Color accentColor = const Color.fromARGB(255, 82, 60, 182);

  static var customFontWhite = GoogleFonts.coiny(
      textStyle: const TextStyle(
        color: Colors.white,
        letterSpacing: 3,
        fontSize: 28,
      )
  );
}