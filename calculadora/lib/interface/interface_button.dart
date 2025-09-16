import 'package:flutter/material.dart';

abstract class ButtonLyrics{
  String uploadLyrics(String label, TextEditingController controller , void Function(String expressao) onExpressao);
}