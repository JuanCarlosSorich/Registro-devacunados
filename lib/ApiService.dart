// ignore_for_file: file_names

import 'dart:convert';
import 'Registro.dart';
import "package:http/http.dart" as http;

class ApiService {
  final String url = 'https://proyectoprogramacionaplicadaapi.azurewebsites.net/api/usuarios';

  Future<List<Registro>> getData() async {
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<Registro> users = [];
      for (var model in jsonResponse) {
        Registro registro = Registro.fromJson(model);
        users.add(registro);
      }

      return users;
    } else {
      throw Exception('Error al llamar al API');
    }
  }
}