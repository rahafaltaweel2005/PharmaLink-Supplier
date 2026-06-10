import '../entity/auth_response_entity.dart';

abstract class AuthRepository {
  Future<AuthResponseEntity> login({
    required String email,
    required String password,
  });


  Future<void> logout();
}
