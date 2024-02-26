import 'package:http/http.dart' as http;
import 'package:tecsu_app/api/url.dart';
import 'dart:convert';

import 'package:tecsu_app/models/producto_modelo.dart';

Future<List<Producto>> listarProductos() async {
  final response = await http.get(Uri.parse('$url/tecsu/products/'));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((json) => Producto.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
