import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tecsu_app/models/listacompra_modelo.dart';
import 'package:tecsu_app/models/usuario_modelo.dart';
import 'package:tecsu_app/screen/detalle_factura.dart';
import 'package:tecsu_app/screen/login.dart';
import 'package:tecsu_app/screen/principal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token1');
  runApp(MyApp(
    initialRoute: token != null ? '/home' : '/',
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      routes: {
        '/': (BuildContext context) => const LoginScreen(),
        '/home': (BuildContext context) => Principal(
              usuario: ModalRoute.of(context)!.settings.arguments as Usuario,
            ),
        '/detalleCompra': (BuildContext context) => DetalleFacturaScreen(
            listaCompra:
                ModalRoute.of(context)!.settings.arguments as ListaCompra),
      },
    );
  }
}
