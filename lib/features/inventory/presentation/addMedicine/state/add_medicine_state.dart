import 'package:pharma_link_supplier/features/inventory/domain/entity/inventory_entity.dart';

abstract class AddMedicineState {}

class AddMedicineInitialState extends AddMedicineState {}

class AddMedicineLoadingState extends AddMedicineState {}

class AddMedicineSuccessState extends AddMedicineState {
  final InventoryEntity inventory;

  AddMedicineSuccessState({required this.inventory});
}

class AddMedicineErrorState extends AddMedicineState {
  final String error;

  AddMedicineErrorState({required this.error});
}
