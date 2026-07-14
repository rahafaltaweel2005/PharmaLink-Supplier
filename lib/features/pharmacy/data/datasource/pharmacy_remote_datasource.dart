
import '../models/pharmacy_model.dart';

abstract class PharmacyRemoteDatasource {
  Future<List<PharmacyModel>> getPharmacies();

  Future<PharmacyModel> getPharmacyById({required int id});

  Future<void> updateStatus({required int pharmacyId, required int status});
}
