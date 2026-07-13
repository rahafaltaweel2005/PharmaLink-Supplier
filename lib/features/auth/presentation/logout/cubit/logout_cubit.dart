import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constant/app_const.dart';
import '../../../../../core/storage/secure_storage_helper.dart';
import '../../../domain/usecase/logout_use_case.dart';
import '../state/logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUseCase logoutUseCase;
  LogoutCubit({required this.logoutUseCase}) : super(LogoutInitialState());

  Future<void> logout() async {
    emit(LogoutLoadingState());
    try {

      final refreshToken = await SecureStorageHelper.read(
        key: AppConst.refreshTokenKey,
      );
      print("Cubit");
      print("Token = $refreshToken");

      await logoutUseCase.call(refreshToken!);
      await SecureStorageHelper.deleteAll();

      emit(LogoutSuccessState());
    } catch (error) {
      emit(LogoutErrorState(error: error.toString()));
    }
  }
}
