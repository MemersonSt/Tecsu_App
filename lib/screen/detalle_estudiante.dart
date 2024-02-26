import 'package:flutter/material.dart';
import 'package:tecsu_app/models/estudiante_modelo.dart';
import 'package:tecsu_app/models/listacompra_modelo.dart';
import 'package:tecsu_app/services/detalle_compra.dart';

class DetalleEstudiante extends StatelessWidget {
  //final String uid;
  final Estudiante estudiante;

  DetalleEstudiante({super.key, required this.estudiante});

  final colors = [
    const Color(0xffFF6868),
    //const Color.fromARGB(255, 28, 218, 176),
    const Color(0xffFFA868),
    //const Color.fromRGBO(30, 95, 116, 1),
    const Color(0xffFFEAA7),
    //const Color.fromRGBO(19, 59, 92, 1),
  ];

  @override
  Widget build(BuildContext context) {
    const colorPrincipal = Color(0xff1D2B53);

    return Scaffold(
      backgroundColor: colorPrincipal,
      body: SafeArea(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            //Nombre del estudiante
            Container(
              color: Colors.transparent,
              height: 140,
              width: 400,
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      'Compras de',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' ${estudiante.nombre}',
                      style: const TextStyle(
                        //color: Color.fromRGBO(246, 236, 169, 1),
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Compras del estudiante

            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: listaOrdenCompra(),
              ),
            )),
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<ListaCompra>> listaOrdenCompra() {
    return FutureBuilder<List<ListaCompra>>(
      future: obtenerComprasEstudiante(estudiante.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.data?.isEmpty ?? true) {
          return const Center(
            child: Text('No hay compras realizadas'),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              final compra = snapshot.data![index];
              return Card(
                color: colors[index % colors.length],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: ListTile(
                  trailing: const Icon(Icons.shopping_bag_rounded),
                  title: Text(
                    'Orden: ${compra.oderId}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Total: ${compra.total} \nFecha: ${compra.fecha}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/detalleCompra',
                      arguments: compra,
                    );
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}
