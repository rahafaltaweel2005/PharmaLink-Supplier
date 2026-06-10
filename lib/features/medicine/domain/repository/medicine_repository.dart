import '../entity/medicine_entity.dart';
import '../entity/medicine_type.dart';

abstract class MedicineRepository {
  Future<List<MedicineEntity>> getMedicines();

  Future<MedicineEntity> getMedicineById({required int id});

  Future<void> deleteMedicine({required int id});

  Future<void> updateMedicine({
    required int id,
    required String name,
    required String imageUrl,
    String? description,
    required double price,
    required MedicineType type,
  });

  Future<MedicineEntity> createMedicine({
    required String name,
    required String imageUrl,
    String? description,
    required double price,
    required MedicineType type,
  });
}
