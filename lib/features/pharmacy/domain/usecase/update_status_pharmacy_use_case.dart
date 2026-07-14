import '../repository/pharmacy_repository.dart';

class UpdateStatusPharmacyUseCase {
  final PharmacyRepository pharmacyRepository;

  UpdateStatusPharmacyUseCase({required this.pharmacyRepository});

  Future<void> call({required int pharmacyId, required int status}) {
    return pharmacyRepository.updateStatusPharmacy(
      pharmacyId: pharmacyId,
      status: status,
    );
  }
}
