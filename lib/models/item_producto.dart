import 'package:tecsu_app/models/producto_modelo.dart';

class ItemProducto {
  final int id;
  final Producto producto;
  final int cantidad;
  final String subtotal;

  ItemProducto(
      {required this.id,
      required this.producto,
      required this.cantidad,
      required this.subtotal});

  factory ItemProducto.fromJson(Map<String, dynamic> json) {
    var list = json['products'] as List;
    List<Producto> productoList =
        list.map((i) => Producto.fromJson(i)).toList();

    return ItemProducto(
      id: json['id'] ?? 0,
      producto: productoList[0],
      cantidad: json['quantity'] ?? 0,
      subtotal: json['total'] ?? 0,
    );
  }
}
