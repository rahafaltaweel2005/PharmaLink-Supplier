
import 'package:pharma_link_supplier/features/pharmacy/domain/entity/pharmacy_entity.dart';

import '../repository/pharmacy_repository.dart';

class GetPharmacyByIdUseCase {
  final PharmacyRepository pharmacyRepository;

  GetPharmacyByIdUseCase({required this.pharmacyRepository});

  Future<PharmacyEntity> call({required int id}) {
    return pharmacyRepository.getPharmacyById(id: id);
  }
}
