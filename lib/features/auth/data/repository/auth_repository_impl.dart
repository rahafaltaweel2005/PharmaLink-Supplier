
import 'package:pharma_link_supplier/features/auth/domain/entity/profile_entity.dart';

import '../../domain/entity/auth_response_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepositoryImpl({required this.authRemoteDatasource});

  @override
  Future<AuthResponseEntity> login({
    required String email,
    required String password,
  }) async {
    final model = await authRemoteDatasource.login(
      email: email,
      password: password,
    );
    return model.toEntity();
  }
  @override
  Future<AuthResponseEntity> register({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    final model = await authRemoteDatasource.register(
      name: name,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );
    return model.toEntity();
  }

  @override
  Future<ProfileEntity> profile() async{
    final model= await authRemoteDatasource.profile();
    return model.toEntity();
  }
  @override
  Future<void> logout() async{
    await authRemoteDatasource.logout();
  }
}
