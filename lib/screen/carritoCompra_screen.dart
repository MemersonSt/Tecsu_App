import 'package:flutter/material.dart';
import 'package:tecsu_app/models/listacompra_modelo.dart';
import 'package:tecsu_app/models/producto_modelo.dart';

class CarritoCompraScreen extends StatelessWidget {
  final List<Producto> listaCompra;

  const CarritoCompraScreen({Key? key, required this.listaCompra})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compra'),
      ),
      body: Center(
        child: Text('Aquí se mostrarán los productos seleccionados'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Lógica para realizar la compra
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
