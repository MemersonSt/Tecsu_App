import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

Future<void> actualizarUsuario(
    String userId, String nombre, File imagen) async {
  var url = 'https://api.example.com/usuarios/$userId';

  var request = http.MultipartRequest('PUT', Uri.parse(url));
  request.fields['nombre'] = nombre;

  if (imagen != null) {}

  var response = await request.send();
  if (response.statusCode == 200) {
    print('Usuario actualizado correctamente');
  } else {
    print(
        'Error al actualizar el usuario. Código de estado: ${response.statusCode}');
  }
}
