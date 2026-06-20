import 'package:pharma_link_supplier/features/inventory/domain/entity/inventory_entity.dart';

abstract class InventoryRepository {
  Future<InventoryEntity> addMedicine({
    required int medicineId,
    required int quantity,
    required DateTime expiryDate,
  });

  Future<void> transferOrder({required int orderId});

  Future<List<InventoryEntity>> getMainInventory();
}
