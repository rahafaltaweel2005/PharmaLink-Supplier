import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/update_status_pharmacy_use_case.dart';
import '../state/update_status_pharmacy_state.dart';

class UpdateStatusPharmacyCubit extends Cubit<UpdateStatusPharmacyState> {
  final UpdateStatusPharmacyUseCase updateStatusPharmacyUseCase;

  UpdateStatusPharmacyCubit({required this.updateStatusPharmacyUseCase})
    : super(UpdateStatusPharmacyInitialState());

  Future<void> updateStatusPharmacy({
    required int pharmacyId,
    required int status,
  }) async {
    emit(UpdateStatusPharmacyLoadingState());
    try {
      await updateStatusPharmacyUseCase(pharmacyId: pharmacyId, status: status);
      emit(UpdateStatusPharmacySuccessState());
    } catch (error) {
      emit(UpdateStatusPharmacyErrorState(error: error.toString()));
    }
  }
}
