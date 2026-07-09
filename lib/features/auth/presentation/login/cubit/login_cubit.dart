import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant/app_const.dart';
import '../../../../../core/storage/secure_storage_helper.dart';
import '../../../domain/usecase/login_use_case.dart';
import '../state/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginInitialState());

  Future<void> login({required String email, required String password}) async {
    print("in cubit 1");
    emit(LoginLoadingState());
    try {
      final result = await loginUseCase(email: email, password: password);
      await SecureStorageHelper.write(
        key: AppConst.accessTokenKey,
        value: result.accessToken,
      );
      /// check Secure storage (if save data)
      /// 1 - access token
      String? savedAccessToken = await SecureStorageHelper.read(key: AppConst.accessTokenKey);
      log("savedAccessToken = $savedAccessToken");
      /// if  savedAccessToken != null mean access token saved
      /// 2 - refresh token
      await SecureStorageHelper.write(
        key: AppConst.refreshTokenKey,
        value: result.refreshToken,
      );
      String? savedRefreshToken = await SecureStorageHelper.read(key: AppConst.refreshTokenKey);
      log("savedRefreshToken = $savedRefreshToken");
      /// 3 - user role
      await SecureStorageHelper.write(
        key: AppConst.roleKey,
        value: result.role.name,
      );
      String? savedUserRole = await SecureStorageHelper.read(key: AppConst.roleKey);
      log("savedUserRole = $savedUserRole");
      /// then emit for success state
      emit(LoginSuccessState(loginResponse: result));
    } catch (error) {
      emit(LoginErrorState(error: error.toString()));
    }
  }
}
