import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tecsu_app/api/url.dart';

Future<void> logoutUser() async {
  // Recuperar el token
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  if (token != null) {
    try {
      final response = await http.post(
        Uri.parse('$url/tecsu/user/logout/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token', // Incluir el token en la solicitud
        },
      );

      if (response.statusCode == 200) {
        print('Sesión cerrada con éxito');
      } else {
        print('Error al cerrar sesión: ${response.reasonPhrase}');
      }
    } catch (e) {
      print(e);
    }
  } else {
    print('No se encontró el token');
  }
}
