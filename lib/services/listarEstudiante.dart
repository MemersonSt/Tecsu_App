import 'dart:convert';

import 'package:tecsu_app/api/url.dart';
import 'package:tecsu_app/models/estudiante_modelo.dart';
import 'package:http/http.dart' as http;

Future<List<Estudiante>> obtenerEstudiantes(String cedulaRepresentante) async {
  String parametro = cedulaRepresentante;
  print('el parametro es: $parametro');
  try {
    final response = await http.get(
      Uri.parse('$url/tecsu/user/list/students/$parametro'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Estudiante.fromJson(data)).toList();
    } else {
      print(response.statusCode);
      throw Exception('Failed to load students');
    }
  } catch (e) {
    return [];
  }
}
