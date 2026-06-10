import '../../domain/entity/medicine_type.dart';
import '../models/medicine_model.dart';

abstract class MedicineRemoteDatasource {
  Future<List<MedicineModel>> getMedicines();

  Future<MedicineModel> getMedicineById({required int id});

  Future<void> deleteMedicine({required int id});

  Future<void> updateMedicine({
    required int id,
    required String name,
    required String imageUrl,
    String? description,
    required double price,
    required MedicineType type,
  });

  Future<MedicineModel> createMedicine({
    required String name,
    required String imageUrl,
    String? description,
    required double price,
    required MedicineType type,
  });
}
