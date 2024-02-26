import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tecsu_app/api/url.dart';
import 'package:tecsu_app/models/user.dart';
import 'package:tecsu_app/models/usuario_modelo.dart';

Future<Map<String, dynamic>?> loginUser(LoginModel loginModel) async {
  try {
    final response = await http.post(
      Uri.parse('$url/tecsu/user/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(loginModel.toJson()),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> data = json.decode(response.body);
      String accessToken = data['token'];
      Usuario usuario = Usuario.fromJson(data['user']);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', accessToken);

      String? savedToken = prefs.getString('token');
      if (savedToken == accessToken) {
        print('El token se guardó correctamente');
      } else {
        print('Hubo un error al guardar el token');
      }
      return {'token': accessToken, 'usuario': usuario};
    } else {
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  }
}
