import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tecsu_app/api/url.dart';
import 'package:tecsu_app/models/listacompra_modelo.dart';

Future<List<ListaCompra>> obtenerComprasEstudiante(String uid) async {
  String codigo = uid;
  try {
    final response = await http.get(
      Uri.parse('$url/tecsu/compras-estudiante/$codigo/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => ListaCompra.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load purchases');
    }
  } catch (e) {
    return [];
  }
}
