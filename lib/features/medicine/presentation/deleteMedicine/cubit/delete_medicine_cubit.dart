
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/delete_medicine_use_case.dart';
import '../state/delete_medicine_state.dart';

class DeleteMedicineCubit extends Cubit<DeleteMedicineState> {
  final DeleteMedicineUseCase deleteMedicineUseCase;

  DeleteMedicineCubit({required this.deleteMedicineUseCase})
    : super(DeleteMedicineInitialState());

  Future<void> deleteMedicine(int id) async {
    emit(DeleteMedicineLoadingState());
    try {
      await deleteMedicineUseCase(id: id);
      emit(DeleteMedicineSuccessState());
    } catch (error) {
      emit(DeleteMedicineErrorState(error: error.toString()));
    }
  }
}
