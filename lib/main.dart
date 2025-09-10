import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculadora/pages/todo_calc.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}
class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoCalc(),
    );
  }
}

