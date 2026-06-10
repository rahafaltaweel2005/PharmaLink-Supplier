

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/medicine_type.dart';
import '../../../domain/usecase/create_medicine_use_case.dart';
import '../state/create_medicine_state.dart';

class CreateMedicineCubit extends Cubit<CreateMedicineState> {
  final CreateMedicineUseCase createMedicineUseCase;


  CreateMedicineCubit({required this.createMedicineUseCase})
    : super(CreateMedicineInitialState());

  Future<void> createMedicine({
    required String name,
    required String imageUrl,
    String? description,
    required double price,
    required MedicineType type,
  }) async {
    emit(CreateMedicineLoadingState());
    try {
     final result = await createMedicineUseCase(
        name: name,
        imageUrl: imageUrl,
        description: description,
        price: price,
        type: type,
      );
      emit(CreateMedicineSuccessState(medicine: result ));
    } catch (error) {
      emit(CreateMedicineErrorState(error: error.toString()));
    }
  }
}
