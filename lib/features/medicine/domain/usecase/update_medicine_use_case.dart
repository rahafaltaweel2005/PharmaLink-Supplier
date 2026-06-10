
import '../entity/medicine_type.dart';
import '../repository/medicine_repository.dart';

class UpdateMedicineUseCase {
  final MedicineRepository medicineRepository;

  UpdateMedicineUseCase({required this.medicineRepository});

  Future<void> call({
    required int id,
    required String name,
    required String imageUrl,
    String? description,
    required double price,
    required MedicineType type,
  }) {
    return medicineRepository.updateMedicine(
      id: id,
      name: name,
      imageUrl: imageUrl,
      description: description,
      price: price,
      type: type,
    );
  }
}
