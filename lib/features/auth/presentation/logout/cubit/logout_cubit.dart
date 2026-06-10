import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/storage/secure_storage_helper.dart';
import '../../../domain/usecase/logout_use_case.dart';
import '../state/logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUseCase logoutUseCase;
  LogoutCubit({required this.logoutUseCase}) : super(LogoutInitialState());

  Future<void> logout() async {
    emit(LogoutLoadingState());
    try {
      await logoutUseCase.call();
      await SecureStorageHelper.deleteAll();

      emit(LogoutSuccessState());
    } catch (error) {
      emit(LogoutErrorState(error: error.toString()));
    }
  }
}
