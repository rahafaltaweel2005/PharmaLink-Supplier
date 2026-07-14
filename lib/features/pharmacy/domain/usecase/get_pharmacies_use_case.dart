import 'package:pharma_link_supplier/features/pharmacy/domain/entity/pharmacy_entity.dart';
import 'package:pharma_link_supplier/features/pharmacy/domain/repository/pharmacy_repository.dart';

class GetPharmaciesUseCase {
  final PharmacyRepository pharmacyRepository;

  GetPharmaciesUseCase({required this.pharmacyRepository});

  Future<List<PharmacyEntity>> call() {
    return pharmacyRepository.getPharmacies();
  }
}
