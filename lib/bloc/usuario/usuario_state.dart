part of 'usuario_cubit.dart';

@immutable
abstract class UsuarioState {}

class UsuarioInitialState extends UsuarioState {
  final existeUsuario = false;
  @override
  String toString() {
    return 'UsuarioInicial: existeUsuario:false';
  }
}

class UsuarioActivoState extends UsuarioState {
  final existeUsuario = true;
  final Usuario usuario;

  UsuarioActivoState(this.usuario);
}
