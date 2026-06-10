abstract class EditMedicineState {}

class EditMedicineInitialState extends EditMedicineState {}

class EditMedicineLoadingState extends EditMedicineState {}

class EditMedicineSuccessState extends EditMedicineState {}

class EditMedicineErrorState extends EditMedicineState {
  final String error;

  EditMedicineErrorState({required this.error});
}
