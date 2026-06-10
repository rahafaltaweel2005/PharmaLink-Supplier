import '../../../../core/constant/api_const.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/storage/secure_storage_helper.dart';
import '../models/auth_response_model.dart';
import 'auth_remote_datasource.dart';

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  @override
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    final response = await ApiClient.post(
      endpoint: ApiConst.login,
      data: {'email': email, 'password': password},
    );
    return AuthResponseModel.fromJson(response.data);
  }

  @override
  Future<void> logout() async {
    await ApiClient.post(endpoint: ApiConst.logout);
    await SecureStorageHelper.deleteAll();
  }
}
