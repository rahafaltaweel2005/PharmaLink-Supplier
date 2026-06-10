import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/medicine_type.dart';
import '../../../domain/usecase/update_medicine_use_case.dart';
import '../state/edit_medicine_state.dart';

class EditMedicineCubit extends Cubit<EditMedicineState> {
  final UpdateMedicineUseCase updateMedicineUseCase;


  EditMedicineCubit({required this.updateMedicineUseCase})
    : super(EditMedicineInitialState());
  Future<void> editMedicine({
    required int id,
    required String name,
    required String imageUrl,
    String? description,
    required double price,
    required MedicineType type,
  }) async {
    emit(EditMedicineLoadingState());
    try {
     await updateMedicineUseCase.call(
        id: id,
        name: name,
        imageUrl: imageUrl,
        description: description,
        price: price,
        type: type,
      );

      emit(EditMedicineSuccessState());
    } catch (error) {
      emit(EditMedicineErrorState(error: error.toString()));
    }
  }
}
