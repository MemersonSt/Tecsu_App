import 'package:flutter/material.dart';
import 'package:tecsu_app/models/listacompra_modelo.dart';
import 'package:tecsu_app/models/producto_modelo.dart';

class ProductoListItem extends StatelessWidget {
  final Producto product;
  final List<Producto> listaCompra;

  const ProductoListItem({
    required this.product,
    required this.listaCompra,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: SizedBox(
          height: 130,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.0,
                child: Image.network(product.imagen),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                  child: _ProductDescription(
                    title: product.nombre,
                    price: '\$${product.precio}',
                    stock: product.stock,
                    categoria: product.categoria,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductDescription extends StatelessWidget {
  final String title;
  final String price;
  final int stock;
  final String categoria;

  const _ProductDescription({
    required this.title,
    required this.price,
    required this.stock,
    required this.categoria,
  });

  void _addToCart(Producto product, List<ListaCompra> listaCompra) {
    // Aquí va tu código para manejar cuando se presiona el botón de agregar al carrito
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(bottom: 10.0)),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 2.0)),
            Text(
              'Disponible: ${stock.toString()}',
              style: const TextStyle(
                fontSize: 15.0,
                color: Colors.black87,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 2.0)),
            Text(
              'Categoría: $categoria',
              style: const TextStyle(
                fontSize: 15.0,
                color: Colors.black87,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 2.0)),
            Text(
              'Precio: $price',
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Spacer(),
        // Agrega aquí el botón de agregar al carrito
        ElevatedButton(
            onPressed: () {
              // Aquí va tu código para manejar cuando se presiona el botón de agregar al carrito}+
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            )),
        const SizedBox(width: 10),
      ],
    );
  }
}
