import 'dart:async';
import 'package:tecsu_app/models/estudiante_modelo.dart';

class EstudianteService {
  final _estudiantesStreamController = StreamController<List<Estudiante>>();

  Stream<List<Estudiante>> get estudiantesStream =>
      _estudiantesStreamController.stream;

  void updateEstudiantes(List<Estudiante> estudiantes) {
    _estudiantesStreamController.add(estudiantes);
  }

  // Asegúrate de cerrar el StreamController cuando ya no lo necesites
  void dispose() {
    _estudiantesStreamController.close();
  }
}
