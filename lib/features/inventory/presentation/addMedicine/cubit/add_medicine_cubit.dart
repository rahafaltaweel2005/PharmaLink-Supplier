import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_link_supplier/features/inventory/presentation/addMedicine/state/add_medicine_state.dart';

import '../../../domain/usecase/add_medicine_use_case.dart';

class AddMedicineCubit extends Cubit<AddMedicineState> {
  final AddMedicineUseCase addMedicineUseCase;

  AddMedicineCubit({required this.addMedicineUseCase})
    : super(AddMedicineInitialState());

  Future<void> addMedicine({
    required int medicineId,
    required int quantity,
    required DateTime expiryDate,
  }) async {
    emit(AddMedicineLoadingState());
    try {
      final result = await addMedicineUseCase(
        medicineId: medicineId,
        quantity: quantity,
        expiryDate: expiryDate,
      );
      emit(AddMedicineSuccessState(inventory: result));
    } catch (error) {
      emit(AddMedicineErrorState(error: error.toString()));
    }
  }
}
