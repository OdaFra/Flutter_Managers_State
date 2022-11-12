import 'package:estados/models/usuario.dart';
import 'package:flutter/cupertino.dart';

class UsuarioService with ChangeNotifier {
  Usuario? _usuario;
  Usuario get usuario => _usuario!;
  bool get existeUsuario => (_usuario != null) ? true : false;

  set usuario(Usuario user) {
    _usuario = user;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    _usuario!.edad = edad;
    notifyListeners();
  }

  removeUsuario() {
    _usuario = null;
    notifyListeners();
  }

  void agregarProfesion() {
    _usuario!.profesiones
        .add('Profesiones:${_usuario!.profesiones.length + 1}');
    notifyListeners();
  }
}
