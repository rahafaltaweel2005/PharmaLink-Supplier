

import '../entity/auth_response_entity.dart';
import '../repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<AuthResponseEntity> call({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    return await authRepository.register(
      name: name,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );
  }
}
