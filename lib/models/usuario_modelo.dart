import 'package:tecsu_app/models/estudiante_modelo.dart';

class Usuario {
  final int id;
  final String username;
  final String email;
  final String name;
  final String lastName;
  final String cedulaIdentidad;
  final String photoUrl =
      'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png';
  late final List<Estudiante> estudiantes;

  Usuario(
      {required this.id,
      required this.username,
      required this.email,
      required this.name,
      required this.lastName,
      required this.cedulaIdentidad,
      required this.estudiantes});

  void getCedula() {
    print('la cedula es: $cedulaIdentidad');
  }

  factory Usuario.fromJson(Map<String, dynamic> json) {
    var list = json['students'] as List;
    List<Estudiante> estudiantesList = list
        .map((i) => Estudiante.fromJson(i))
        .toList(); // Convierte cada estudiante en la lista a un objeto Estudiante

    return Usuario(
      id: json['id'] is String ? int.parse(json['id']) : json['id'] ?? 0,
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      lastName: json['last_name'] ?? '',
      cedulaIdentidad: json['numero_identidad'] ?? '',
      estudiantes: estudiantesList, // Asigna la lista de estudiantes
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'name': name,
        'last_name': lastName,
        'numero_identidad': cedulaIdentidad,
        'students': estudiantes,
      };
}
