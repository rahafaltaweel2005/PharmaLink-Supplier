import 'package:pharma_link_supplier/features/auth/data/models/profile_model.dart';

import '../models/auth_response_model.dart';

abstract class AuthRemoteDatasource {
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  });

  Future<AuthResponseModel> register({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  });

  Future<ProfileModel> profile();

  Future<void> logout();
}
