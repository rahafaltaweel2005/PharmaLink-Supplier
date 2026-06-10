import '../../../domain/entity/auth_response_entity.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final AuthResponseEntity loginResponse;

  LoginSuccessState({required this.loginResponse});
}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState({required this.error});
}
