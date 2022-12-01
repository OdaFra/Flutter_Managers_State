import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:estados/models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) {
      print('Activate User');
      emit(UserSetState(
        event.user,
      ));
    });
    on<ChangeUserAge>((event, emit) {
      print('ChangeUserAge called');
      if (state.exitsUser) return;
      emit(UserSetState(state.user!.copyWith(edad: event.age)));
    });

    on<AddProfession>((event, emit) {
      if (!state.exitsUser) return;
      final professions = [...state.user!.profesiones, event.profesion];
      emit(UserSetState(state.user!.copyWith(profesiones: professions)));
    });

    on<ResetUser>((event, emit) => emit(const UserInitialState()));
  }
}
