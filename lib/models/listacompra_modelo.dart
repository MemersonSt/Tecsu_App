import 'item_producto.dart';

class ListaCompra {
  final int oderId;
  final String uid;
  final List<ItemProducto> detalleProducto;
  final String total;
  final String fecha;

  ListaCompra(
      {required this.oderId,
      required this.uid,
      required this.detalleProducto,
      required this.total,
      required this.fecha});

  factory ListaCompra.fromJson(Map<String, dynamic> json) {
    var list = json['product_detail'] as List;
    List<ItemProducto> detalleProductoList =
        list.map((i) => ItemProducto.fromJson(i)).toList();

    return ListaCompra(
      oderId: json['id_shopping'] ?? 0,
      uid: json['uid'] ?? '',
      detalleProducto: detalleProductoList,
      total: json['total'] ?? 0,
      fecha: json['date'] ?? '',
    );
  }
}
