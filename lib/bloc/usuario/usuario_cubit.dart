import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:estados/models/usuario.dart';
part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitialState());

  void seleccionarUsuario(Usuario user) {
    emit(UsuarioActivoState(user));
  }
}