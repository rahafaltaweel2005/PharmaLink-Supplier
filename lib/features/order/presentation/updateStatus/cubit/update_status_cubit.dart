import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_link_supplier/features/order/domain/usecase/update_status_use_case.dart';

import '../state/update_status_state.dart';

class UpdateStatusCubit extends Cubit<UpdateStatusState> {
  final UpdateStatusUseCase updateStatusUseCase;

  UpdateStatusCubit({required this.updateStatusUseCase})
    : super(UpdateStatusInitialState());

  Future<void> updateStatus({required int orderId, required int status}) async {
    emit(UpdateStatusLoadingState());
    try {
      await updateStatusUseCase(orderId: orderId, status: status);
      emit(UpdateStatusSuccessState());
    } catch (error) {
      emit(UpdateStatusErrorState(error: error.toString()));
    }
  }
}
