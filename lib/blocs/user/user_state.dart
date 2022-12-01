part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool exitsUser;
  final Usuario? user;

  const UserState({
    this.exitsUser = false,
    this.user,
  });
}

class UserInitialState extends UserState {
  const UserInitialState() : super(exitsUser: false, user: null);
}

class UserSetState extends UserState {
  final Usuario newUser;

  const UserSetState(this.newUser)
      : super(
          exitsUser: true,
          user: newUser,
        );
}
