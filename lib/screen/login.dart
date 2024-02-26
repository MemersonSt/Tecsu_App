import 'package:flutter/material.dart';
import 'package:tecsu_app/models/user.dart';
import 'package:tecsu_app/models/usuario_modelo.dart';
import 'package:tecsu_app/services/user_api.dart';
import 'package:tecsu_app/widgets/input_decoration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            contenedorFondo(size), //llama a la funcion contenedorFondo azul
            contenedorIcon(), //llama a la funcion contenedorIcon
            loginForm(context) //llama a la funcion loginForm
          ],
        ),
      ),
    );
  }

  SingleChildScrollView loginForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 300),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                )
              ],
            ),
            child: Column(
              children: [
                const Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecorations.authInputDecoration(
                          labelText: 'Ingrese su usuario',
                          icon: const Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor ingrese su usuario';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecorations.authInputDecoration(
                          labelText: 'Ingrese su contraseña',
                          icon: const Icon(Icons.lock),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor ingrese su contraseña';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      _isLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  _isLoading = true;
                                });
                                try {
                                  Map<String, dynamic>? respuesta =
                                      await loginUser(
                                    LoginModel(
                                      username: _usernameController.text,
                                      password: _passwordController.text,
                                    ),
                                  );
                                  if (respuesta != null) {
                                    // ignore: unused_local_variable
                                    String token = respuesta['token'];
                                    Usuario user = respuesta['usuario'];
                                    // ignore: unused_local_variable
                                    String name = user.name;
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushReplacementNamed(
                                      context,
                                      '/home',
                                      arguments: user,
                                    );
                                  } else {
                                    // ignore: use_build_context_synchronously
                                    return showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('Error'),
                                        content: const Text(
                                            'Usuario o contraseña incorrectos'),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                } finally {
                                  setState(
                                    () {
                                      _isLoading = false;
                                    },
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(100,
                                    60), //tamaño del boton de inicio de sesion
                                maximumSize: const Size(600,
                                    60), //tamaño del boton de inicio de sesion
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'Iniciar Sesión',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  SafeArea contenedorIcon() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 60),
        width: double.infinity,
        child: Image.asset(
          'assets/tecsu.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }

  Container contenedorFondo(Size size) {
    return Container(
      color: Color.fromRGBO(22, 85, 148, 1),
      width: double.infinity,
      height: size.height * 0.4,
    );
  }
}
