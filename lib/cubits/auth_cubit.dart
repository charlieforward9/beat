import 'package:beat/data/User/services/UserService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthState {}

class Unauth extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFail extends AuthState {
  final Exception exception;

  AuthFail({required this.exception});
}

class AuthCubit extends Cubit<AuthState> {
  final userService = UserService();

  AuthCubit() : super(Unauth());

  void authUser() async {
    if (state is AuthSuccess == false) {
      emit(Unauth());
    }
    try {
      await userService
          .initUser()
          .then((user) => userService.populateGlobal(user))
          .then((_) => emit(AuthSuccess()));
    } catch (e) {
      emit(AuthFail(exception: Exception(e)));
    }
  }
}
