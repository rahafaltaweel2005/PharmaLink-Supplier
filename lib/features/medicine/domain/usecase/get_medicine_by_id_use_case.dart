

import '../entity/medicine_entity.dart';
import '../repository/medicine_repository.dart';

class GetMedicineByIdUseCase {
  final MedicineRepository medicineRepository;

  GetMedicineByIdUseCase({required this.medicineRepository});

  Future<MedicineEntity> call({required int id}){
    return medicineRepository.getMedicineById(id: id);
  }
}
