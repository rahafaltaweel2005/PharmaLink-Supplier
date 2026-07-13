import '../entity/auth_response_entity.dart';
import '../entity/profile_entity.dart';

abstract class AuthRepository {
  Future<AuthResponseEntity> login({
    required String email,
    required String password,
  });

  Future<AuthResponseEntity> register({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  });

  Future<ProfileEntity> profile();

  Future<void> logout(String refreshToken);
}
