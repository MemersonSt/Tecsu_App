import 'package:flutter/material.dart';
import 'package:tecsu_app/models/producto_modelo.dart';
import 'package:tecsu_app/screen/carritoCompra_screen.dart';
import 'package:tecsu_app/services/listarProductos_productos.dart';
import 'package:tecsu_app/widgets/producto_widget.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  final TextEditingController _filter = TextEditingController();

  List<Producto> data = []; // Lista de productos no modificable
  List<Producto> _products =
      []; // Lista de productos modificable o para mostrar
  List<Producto> listaCompra =
      []; // Lista de productos en el carrito de compras

  @override
  void initState() {
    super.initState();
    listarProductos().then((value) {
      setState(() {
        data = value;
        _products = data;
      });
    });
  }

  void cargarProductos() {
    listarProductos().then((value) {
      setState(() {
        _products = data;
      });
    });
  }

  void buscarProductos() {
    filtrarProductos(_filter.text);
  }

  void filtrarProductos(String query) {
    final List<Producto> searchProducts = data
        .where((product) =>
            product.nombre.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      _products = searchProducts;
    });
  }

  void filtrarPorCategoria(String categoria) {
    final List<Producto> filterProducts = data
        .where((product) => product.categoria.toLowerCase() == categoria)
        .toList();
    setState(() {
      _products = filterProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            barraBuscador(), // Barra de búsqueda
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: const Color(0xffFF6868),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      // Aquí va tu código para filtrar los productos por categoría cuando se presiona la tarjeta
                      filtrarPorCategoria('snack');
                    },
                    child: Card(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            12.0), // Ajusta el valor para cambiar cuánto se redondean los bordes
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(
                            10.0), // Ajusta el padding como necesites
                        child: Column(
                          children: <Widget>[
                            Icon(Icons
                                .fastfood), // Aquí puedes poner el icono que quieras
                            Text(
                                'Snacks'), // Aquí puedes poner el nombre de la categoría
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: const Color(0xffFF6868),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      // Aquí va tu código para filtrar los productos por categoría cuando se presiona la tarjeta
                      filtrarPorCategoria('bebidas');
                    },
                    child: Card(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            12.0), // Ajusta el valor para cambiar cuánto se redondean los bordes
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(
                            10.0), // Ajusta el padding como necesites
                        child: Column(
                          children: <Widget>[
                            Icon(Icons
                                .no_drinks_rounded), // Aquí puedes poner el icono que quieras
                            Text(
                                'Bebidas'), // Aquí puedes poner el nombre de la categoría
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: const Color(0xffFF6868),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      // Aquí va tu código para filtrar los productos por categoría cuando se presiona la tarjeta
                      filtrarPorCategoria('fruta');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            12.0), // Ajusta el valor para cambiar cuánto se redondean los bordes
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(
                            10.0), // Ajusta el padding como necesites
                        child: Column(
                          children: <Widget>[
                            Icon(Icons
                                .apple_rounded), // Aquí puedes poner el icono que quieras
                            Text(
                                'fruta'), // Aquí puedes poner el nombre de la categoría
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: const Color(0xffFF6868),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      // Aquí va tu código para filtrar los productos por categoría cuando se presiona la tarjeta
                      cargarProductos();
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            12.0), // Ajusta el valor para cambiar cuánto se redondean los bordes
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(
                            10.0), // Ajusta el padding como necesites
                        child: Column(
                          children: <Widget>[
                            Icon(Icons
                                .store_rounded), // Aquí puedes poner el icono que quieras
                            Text(
                                'Todos'), // Aquí puedes poner el nombre de la categoría
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  return ProductoListItem(
                    product: _products[index],
                    listaCompra: listaCompra,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row barraBuscador() {
    return Row(
      children: <Widget>[
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: const Color(0xffFFEAA7),
            ),
            child: TextField(
              controller: _filter,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search products...',
                border: InputBorder.none,
              ),
              onSubmitted: (value) {
                buscarProductos();
              },
            ),
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
          icon: const Icon(Icons.shopping_cart_rounded),
          onPressed: () {
            // Aquí va tu código para manejar cuando se presiona el botón del carrito de compras
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CarritoCompraScreen(
                  listaCompra: listaCompra,
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
