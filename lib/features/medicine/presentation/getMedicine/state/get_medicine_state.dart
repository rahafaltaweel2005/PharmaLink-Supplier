import '../../../domain/entity/medicine_entity.dart';

abstract class GetMedicineState {}

class GetMedicineInitialState extends GetMedicineState {}

class GetMedicineLoadingState extends GetMedicineState {}

class GetMedicineLoadedState extends GetMedicineState {
  final List<MedicineEntity> medicines;

  GetMedicineLoadedState({required this.medicines});
}

class GetMedicineErrorState extends GetMedicineState {
  final String error;

  GetMedicineErrorState({required this.error});
}
