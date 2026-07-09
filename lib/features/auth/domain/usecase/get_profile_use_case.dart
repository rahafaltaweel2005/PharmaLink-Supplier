import '../entity/profile_entity.dart';
import '../repository/auth_repository.dart';

class GetProfileUseCase {
  final AuthRepository authRepository;

  GetProfileUseCase({required this.authRepository});

  Future<ProfileEntity> call() async {
    return await authRepository.profile();
  }
}
