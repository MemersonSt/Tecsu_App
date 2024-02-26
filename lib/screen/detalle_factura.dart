import 'package:flutter/material.dart';
import 'package:tecsu_app/models/listacompra_modelo.dart';

// ignore: must_be_immutable
class DetalleFacturaScreen extends StatelessWidget {
  ListaCompra listaCompra;

  DetalleFacturaScreen({super.key, required this.listaCompra});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de Compra'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Compra: ${listaCompra.oderId}', // Numero de la compra
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.shopping_cart, size: 100),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Text(
            'Total: ${listaCompra.total}', // Total de la compra
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          const Divider(height: 20),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: listaCompra.detalleProducto.length,
              itemBuilder: (context, index) {
                final producto = listaCompra.detalleProducto[index];
                return ListTile(
                  title: Text(
                    producto.producto.nombre,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Cantidad: ${producto.cantidad} \nPrecio: ${producto.producto.precio}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Mostrar la imagen del producto encima del subtotal
                  leading: Image.network(
                    producto.producto.imagen,
                    width: 120,
                    height: 200,
                    scale: 0.1,
                  ),
                  trailing: Text(
                    'Subtotal: ${producto.subtotal}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
