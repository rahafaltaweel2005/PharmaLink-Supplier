
import '../entity/medicine_entity.dart';
import '../entity/medicine_type.dart';
import '../repository/medicine_repository.dart';

class CreateMedicineUseCase {
  final MedicineRepository medicineRepository;

  CreateMedicineUseCase({required this.medicineRepository});

  Future<MedicineEntity> call({
    required String name,
    required String imageUrl,
    String? description,
    required double price,
    required MedicineType type,
  }) {
    return medicineRepository.createMedicine(
      name: name,
      imageUrl: imageUrl,
      description: description,
      price: price,
      type: type,
    );
  }
}
