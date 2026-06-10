import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant/app_const.dart';
import '../../../../../core/storage/secure_storage_helper.dart';
import '../../../domain/usecase/login_use_case.dart';
import '../state/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginInitialState());

  Future<void> login({
    required String email,
    required String password
  }) async {
    emit(LoginLoadingState());
    try {
      final result = await loginUseCase(
          email: email,
          password: password
      );
      await SecureStorageHelper.write(
          key: AppConst.accessTokenKey, value: result.accessToken);
      await SecureStorageHelper.write(
          key: AppConst.refreshTokenKey, value: result.refreshToken);
      await SecureStorageHelper.write(key: AppConst.roleKey, value: result.role.name);
      emit(LoginSuccessState(loginResponse: result));
        }catch(error){
      emit(LoginErrorState(error: error.toString()));
    }
  }
}
