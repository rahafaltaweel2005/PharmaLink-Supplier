import '../../../domain/entity/auth_response_entity.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final AuthResponseEntity registerResponse;

  RegisterSuccessState({required this.registerResponse});
}

class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState({required this.error});
}
