import 'package:pharma_link_supplier/features/pharmacy/domain/entity/pharmacy_entity.dart';

import '../../domain/repository/pharmacy_repository.dart';
import '../datasource/pharmacy_remote_datasource.dart';

class PharmacyRepositoryImpl extends PharmacyRepository {
  final PharmacyRemoteDatasource pharmacyRemoteDatasource;

  PharmacyRepositoryImpl({required this.pharmacyRemoteDatasource});

  @override
  Future<List<PharmacyEntity>> getPharmacies() async {
    final model = await pharmacyRemoteDatasource.getPharmacies();
    return model.map((pharmacy) => pharmacy.toEntity()).toList();
  }

  @override
  Future<PharmacyEntity> getPharmacyById({required int id}) async {
    final model = await pharmacyRemoteDatasource.getPharmacyById(id: id);
    return model.toEntity();
  }

  @override
  Future<void> updateStatusPharmacy({
    required int pharmacyId,
    required int status,
  }) async {
    await pharmacyRemoteDatasource.updateStatus(
      pharmacyId: pharmacyId,
      status: status,
    );
  }
}
