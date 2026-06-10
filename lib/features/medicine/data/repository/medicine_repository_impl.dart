
import '../../domain/entity/medicine_entity.dart';
import '../../domain/entity/medicine_type.dart';
import '../../domain/repository/medicine_repository.dart';
import '../datasource/medicine_remote_datasource.dart';

class MedicineRepositoryImpl extends MedicineRepository {
  final MedicineRemoteDatasource medicineRemoteDatasource;

  MedicineRepositoryImpl({required this.medicineRemoteDatasource});

  @override
  Future<MedicineEntity> createMedicine({
    required String name,
    required String imageUrl,
    String? description,
    required double price,
    required MedicineType type,
  }) async {
    final model = await medicineRemoteDatasource.createMedicine(
      name: name,
      imageUrl: imageUrl,
      description: description,
      price: price,
      type: type,
    );
    return model.toEntity();
  }

  @override
  Future<void> deleteMedicine({required int id}) async {
    await medicineRemoteDatasource.deleteMedicine(id: id);
  }

  @override
  Future<MedicineEntity> getMedicineById({required int id}) async {
    final model = await medicineRemoteDatasource.getMedicineById(id: id);
    return model.toEntity();
  }

  @override
  Future<List<MedicineEntity>> getMedicines() async {
    final model = await medicineRemoteDatasource.getMedicines();
    return model.map((medicine) => medicine.toEntity()).toList();
  }

  @override
  Future<void> updateMedicine({
    required int id,
    required String name,
    required String imageUrl,
    String? description,
    required double price,
    required MedicineType type,
  }) async {
    await medicineRemoteDatasource.updateMedicine(
      id: id,
      name: name,
      imageUrl: imageUrl,
      description: description,
      price: price,
      type: type,
    );
  }
}
