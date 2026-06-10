import '../../../domain/entity/medicine_entity.dart';

abstract class GetMedicineByIdState {}

class GetMedicineByIdInitialState extends GetMedicineByIdState {}

class GetMedicineByIdLoadingState extends GetMedicineByIdState {}

class GetMedicineByIdLoadedState extends GetMedicineByIdState {
  final MedicineEntity medicine;

  GetMedicineByIdLoadedState({required this.medicine});
}

class GetMedicineByIdErrorState extends GetMedicineByIdState {
  final String error;

  GetMedicineByIdErrorState({required this.error});
}
