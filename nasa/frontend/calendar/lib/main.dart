
import 'dart:convert';

import 'package:calendar/models/response_api.dart';
import 'package:calendar/page/calendar_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        useMaterial3: true,
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme
        ).apply(
          bodyColor:  Colors.white,
          displayColor: Colors.white
        )
      ),
      home: CalendarPage(response:_responseHttp,)
    );
  }

  Future<List<ResponseApi>>  _responseHttp() async{
    final url = Uri.parse("http://localhost:8080/user?ano=2025");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);

      final List<ResponseApi> eventList = jsonList
          .map((jsonItem) => ResponseApi.fromJson(jsonItem))
          .toList();

      return eventList;
    } else {
      throw Exception('Falha ao carregar eventos. Status: ${response.statusCode}');
    }
    
  }
}