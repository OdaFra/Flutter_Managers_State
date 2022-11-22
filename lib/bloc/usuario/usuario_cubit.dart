import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:estados/models/usuario.dart';
part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitialState());

  void seleccionarUsuario(Usuario user) {
    emit(UsuarioActivoState(user));
  }

  void cambiarEdad(int edad) {
    final currentState = state;
    if (currentState is UsuarioActivoState) {
      final newUser = currentState.usuario.copyWith(edad: 32);
      emit(UsuarioActivoState(newUser));
    }
  }

  void agregarProfesion() {
    final currentState = state;
    if (currentState is UsuarioActivoState) {
      final newProfesiones = [
        ...currentState.usuario.profesiones!,
        'profesion ${currentState.usuario.profesiones!.length + 1}'
      ];
      final newUsuario =
          currentState.usuario.copyWith(profesiones: newProfesiones);
      emit(UsuarioActivoState(newUsuario));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitialState());
  }
}
