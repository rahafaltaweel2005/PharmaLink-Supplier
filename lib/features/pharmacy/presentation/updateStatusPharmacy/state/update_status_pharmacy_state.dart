abstract class UpdateStatusPharmacyState {}

class UpdateStatusPharmacyInitialState extends UpdateStatusPharmacyState {}

class UpdateStatusPharmacyLoadingState extends UpdateStatusPharmacyState {}

class UpdateStatusPharmacySuccessState extends UpdateStatusPharmacyState {}

class UpdateStatusPharmacyErrorState extends UpdateStatusPharmacyState {
  final String error;

  UpdateStatusPharmacyErrorState({required this.error});
}
