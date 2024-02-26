import 'package:flutter/material.dart';
import 'package:tecsu_app/models/estudiante_modelo.dart';
import 'package:tecsu_app/models/usuario_modelo.dart';
import 'package:tecsu_app/screen/detalle_estudiante.dart';
import 'package:tecsu_app/services/listarEstudiante.dart';
import 'package:tecsu_app/services/logout_user.dart';

class Home extends StatefulWidget {
  final Usuario usuario;
  final double total;

  Home({Key? key, required this.usuario})
      : total = usuario.estudiantes
            .fold(0.0, (prev, element) => prev + element.balance),
        super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String get nombre => widget.usuario.name;

  String get apellido => widget.usuario.lastName;

  String get cedula => widget.usuario.cedulaIdentidad;

  // Define una lista de colores
  final colors = [
    const Color(0xffFF6868),
    //const Color.fromARGB(255, 28, 218, 176),
    const Color(0xffFFA868),
    //const Color.fromRGBO(30, 95, 116, 1),
    const Color(0xffFFEAA7),
    //const Color.fromRGBO(19, 59, 92, 1),
  ];

  final colorPrincipal = const Color(0xff1D2B53);

  List<Estudiante> estudiantes = [];

  @override
  void initState() {
    super.initState();
    getListarEstudiante(cedula);
  }

  void getListarEstudiante(parametro) async {
    estudiantes = await obtenerEstudiantes(parametro);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    'Tecsu App',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  avatar(context),
                ],
              ),
            ),
            panelBienvenida(),
            const SizedBox(height: 20),
            Expanded(
                child: listaEstudiantes(
                    cedula)), // llama a la funcion lista de estudiantes
          ],
        ),
      ),
    );
  }

  Container panelBienvenida() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      width: 400,
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xff40A2E3),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Row(
            children: [
              Text(
                'hola',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                '👋', // Aquí puedes poner el emoji que quieras
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
          Text(
            nombre,
            style: const TextStyle(
              color: Color.fromRGBO(32, 14, 58, 1),
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.usuario.estudiantes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: colors[index % colors.length],
                    child: Text(
                      widget.usuario.estudiantes[index].nombre[0],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          //const SizedBox(height: 10),
        ],
      ),
    );
  }

  Theme avatar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        popupMenuTheme: PopupMenuThemeData(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      child: PopupMenuButton<int>(
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(widget.usuario.photoUrl),
            radius: 20,
          ),
        ),
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 1,
            child: Text("Seleccionar imagen"),
          ),
        ],
        onSelected: (value) {
          if (value == 1) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  title: Text('Seleccionaste la opción 1'),
                  content: Text(
                      'Proximamente podrás seleccionar una imagen de perfil'),
                );
              },
            );
          } else if (value == 2) {
            logoutUser().then((_) => {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false)
                });
          }
        },
      ),
    );
  }

  Widget listaEstudiantes(String param) {
    return RefreshIndicator(
      onRefresh: () async {
        estudiantes = await obtenerEstudiantes(param);
        setState(() {});
      },
      child: FutureBuilder<List<Estudiante>>(
        future: estudiantes.isEmpty
            ? obtenerEstudiantes(param)
            : Future.value(estudiantes),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.data?.isEmpty ?? true) {
            return const Center(
              child: Text('No tiene representados'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                final estudiante = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetalleEstudiante(estudiante: estudiante),
                      ),
                    );
                  },
                  child: Card(
                    color: colors[index % colors.length],
                    margin: const EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 20,
                    child: Container(
                      width: 200,
                      transformAlignment: Alignment.center,
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10.0),
                        leading: CircleAvatar(
                          radius: 40,
                          child: Text(
                            estudiante.nombre[0],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          estudiante.nombre,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          estudiante.apellidos,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          '\$${estudiante.balance.toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
