
import 'package:calendar/models/response_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<ResponseApi>>  responseHttp() async{
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