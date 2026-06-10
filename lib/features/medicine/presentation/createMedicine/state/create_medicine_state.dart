import '../../../domain/entity/medicine_entity.dart';

abstract class CreateMedicineState {}

class CreateMedicineInitialState extends CreateMedicineState {}

class CreateMedicineLoadingState extends CreateMedicineState {}

class CreateMedicineSuccessState extends CreateMedicineState {
  final MedicineEntity medicine;

  CreateMedicineSuccessState({required this.medicine});
}

class CreateMedicineErrorState extends CreateMedicineState {
  final String error;

  CreateMedicineErrorState({required this.error});
}
