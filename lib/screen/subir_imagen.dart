/*import 'package:flutter/material.dart';

class SubirImagen extends StatefulWidget {
  @override
  _SubirImagenState createState() => _SubirImagenState();
}

class _SubirImagenState extends State<SubirImagen> {
  // Variables para almacenar el avatar seleccionado y la imagen subida
  String avatarUrl;
  String imageUrl;

  // Método para seleccionar un avatar
  void seleccionarAvatar() {
    // Implementa la lógica para seleccionar un avatar
    setState(() {
      // Asigna la URL del avatar seleccionado
      avatarUrl = 'URL_DEL_AVATAR_POR_DEFECTO';
    });
  }
    
  }

  // Método para subir la imagen al servidor de Django
  void subirImagen() {
    // Implementa la lógica para subir la imagen al servidor de Django
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subir Imagen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Muestra el avatar seleccionado
            avatarUrl != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(avatarUrl),
                    radius: 50,
                  )
                : Container(),
            SizedBox(height: 20),
            // Botón para seleccionar un avatar
            RaisedButton(
              onPressed: seleccionarAvatar,
              child: Text('Seleccionar Avatar'),
            ),
            SizedBox(height: 20),
            // Botón para subir la imagen
            RaisedButton(
              onPressed: subirImagen,
              child: Text('Subir Imagen'),
            ),
            SizedBox(height: 20),
            // Muestra la imagen subida
            imageUrl != null
                ? Image.network(imageUrl)
                : Container(),
          ],
        ),
      ),
    );
  }
}*/
