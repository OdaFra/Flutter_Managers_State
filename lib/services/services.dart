import 'package:estados/models/usuario.dart';
import 'package:flutter/cupertino.dart';

class UsuarioService with ChangeNotifier {
  Usuario? _usuario;
  Usuario get usuario => _usuario!;
  bool get existeUsuario => (_usuario != null) ? true : false;
}
