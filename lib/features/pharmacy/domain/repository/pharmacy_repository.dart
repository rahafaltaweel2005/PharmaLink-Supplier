import '../entity/pharmacy_entity.dart';

abstract class PharmacyRepository {
  Future<List<PharmacyEntity>> getPharmacies();

  Future<PharmacyEntity> getPharmacyById({required int id});

  Future<void> updateStatusPharmacy({required int pharmacyId, required int status});
}
