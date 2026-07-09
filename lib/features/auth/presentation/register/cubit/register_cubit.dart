

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant/app_const.dart';
import '../../../../../core/storage/secure_storage_helper.dart';
import '../../../domain/usecase/register_use_case.dart';
import '../state/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit({required this.registerUseCase})
    : super(RegisterInitialState());

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,

  }) async {
    emit(RegisterLoadingState());
    try {
      final result = await registerUseCase(
        name: name,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
      );
      await SecureStorageHelper.write(
        key: AppConst.accessTokenKey,
        value: result.accessToken,
      );
      await SecureStorageHelper.write(
        key: AppConst.refreshTokenKey,
        value: result.refreshToken,
      );
      await SecureStorageHelper.write(
        key: AppConst.roleKey,
        value: result.role.name,
      );
      emit(RegisterSuccessState(registerResponse: result));
    } catch (error) {
      emit(RegisterErrorState(error: error.toString()));
    }
  }
}
