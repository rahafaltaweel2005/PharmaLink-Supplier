
import '../repository/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository authRepository;

  LogoutUseCase({required this.authRepository});

  Future<void> call(String refreshToken){
    print("UseCase");
    return authRepository.logout(refreshToken);
  }
}
