import 'package:pharma_link_supplier/features/pharmacy/domain/entity/pharmacy_entity.dart';

abstract class GetPharmaciesState {}

class GetPharmaciesInitialState extends GetPharmaciesState {}

class GetPharmaciesLoadingState extends GetPharmaciesState {}

class GetPharmaciesLoadedState extends GetPharmaciesState {
  final List<PharmacyEntity> pharmacy;

  GetPharmaciesLoadedState({required this.pharmacy});
}

class GetPharmaciesErrorState extends GetPharmaciesState {
  final String error;

  GetPharmaciesErrorState({required this.error});
}
