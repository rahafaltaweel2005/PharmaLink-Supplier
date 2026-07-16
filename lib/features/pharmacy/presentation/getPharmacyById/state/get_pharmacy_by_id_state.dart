import 'package:pharma_link_supplier/features/pharmacy/domain/entity/pharmacy_entity.dart';

abstract class GetPharmacyByIdState {}

class GetPharmacyInitialState extends GetPharmacyByIdState {}

class GetPharmacyLoadingState extends GetPharmacyByIdState {}

class GetPharmacyLoadedState extends GetPharmacyByIdState {
  final PharmacyEntity pharmacy;

  GetPharmacyLoadedState({required this.pharmacy});
}

class GetPharmacyErrorState extends GetPharmacyByIdState {
  final String error;

  GetPharmacyErrorState({required this.error});
}
