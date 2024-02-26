import 'package:flutter/material.dart';
import 'package:tecsu_app/models/usuario_modelo.dart';
import 'package:tecsu_app/screen/home_screen.dart';
import 'package:tecsu_app/screen/profile_screen.dart';

// ignore: must_be_immutable
class Principal extends StatefulWidget {
  Usuario usuario;
  Principal({Key? key, required this.usuario}) : super(key: key);

  @override
  State<Principal> createState() => PrincipalState();
}

class PrincipalState extends State<Principal> {
  Usuario get usuario => widget.usuario;
  late double total;
  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    total = usuario.estudiantes
        .fold(0.0, (prev, element) => prev + element.balance);
    _widgetOptions = <Widget>[
      Home(usuario: usuario),
      ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String get nombre => usuario.name;
  String get apellido => usuario.lastName;

  final colorPrincipal = const Color(0xff1D2B53);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorPrincipal,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Principal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white10,
        onTap: _onItemTapped,
      ),
    );
  }
}
