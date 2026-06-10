import '../repository/medicine_repository.dart';

class DeleteMedicineUseCase {
  final MedicineRepository medicineRepository;

  DeleteMedicineUseCase({required this.medicineRepository});

  Future<void> call({required int id}) {
    return medicineRepository.deleteMedicine(id: id);
  }
}
