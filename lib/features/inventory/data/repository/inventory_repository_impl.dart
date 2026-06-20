import 'package:pharma_link_supplier/features/inventory/domain/entity/inventory_entity.dart';

import '../../domain/repository/inventory_repository.dart';
import '../datasource/inventory_remote_datasource.dart';

class InventoryRepositoryImpl extends InventoryRepository {
  final InventoryRemoteDatasource inventoryRemoteDatasource;

  InventoryRepositoryImpl({required this.inventoryRemoteDatasource});

  @override
  Future<InventoryEntity> addMedicine({
    required int medicineId,
    required int quantity,
    required DateTime expiryDate,
  }) async {
    final model = await inventoryRemoteDatasource.addMedicine(
      medicineId: medicineId,
      quantity: quantity,
      expiryDate: expiryDate,
    );
    return model.toEntity();
  }

  @override
  Future<List<InventoryEntity>> getMainInventory() async {
    final model = await inventoryRemoteDatasource.getMainInventory();
    return model.map((medicine) => medicine.toEntity()).toList();
  }

  @override
  Future<void> transferOrder({required int orderId}) async {
    await inventoryRemoteDatasource.transferOrder(orderId: orderId);
  }
}
