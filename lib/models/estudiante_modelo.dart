class Estudiante {
  final int id;
  final String cedulaIdentificacion;
  final String uid;
  final String nombre;
  final String apellidos;
  final double balance;
  final String representante;
  final String photoUrl =
      'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png';

  Estudiante(
      {required this.id,
      required this.cedulaIdentificacion,
      required this.uid,
      required this.nombre,
      required this.apellidos,
      required this.balance,
      required this.representante});

  factory Estudiante.fromJson(Map<String, dynamic> json) {
    return Estudiante(
        id: json['id'] ?? 0,
        cedulaIdentificacion: json['cedula'] ?? '',
        uid: json['uid'] ?? '',
        nombre: json['name'] ?? '',
        apellidos: json['last_name'] ?? '',
        balance: json['balance'] ?? 0,
        representante: json['Representative'] ?? '');
  }
}
