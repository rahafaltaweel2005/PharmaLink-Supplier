
import '../entity/medicine_entity.dart';
import '../repository/medicine_repository.dart';

class GetMedicinesUseCase {
  final MedicineRepository medicineRepository;

  GetMedicinesUseCase({required this.medicineRepository});

  Future<List<MedicineEntity>> call() {
    return medicineRepository.getMedicines();
  }
}
