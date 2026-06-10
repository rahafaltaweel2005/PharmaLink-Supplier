import '../../../domain/entity/medicine_entity.dart';

abstract class  DeleteMedicineState {}

class DeleteMedicineInitialState extends DeleteMedicineState {}

class DeleteMedicineLoadingState extends DeleteMedicineState {}

class DeleteMedicineSuccessState extends DeleteMedicineState {}


class DeleteMedicineErrorState extends DeleteMedicineState {
  final String error;

  DeleteMedicineErrorState({required this.error});
}
