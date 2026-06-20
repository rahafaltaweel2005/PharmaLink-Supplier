
import '../models/inventory_model.dart';

abstract class InventoryRemoteDatasource {
  Future<InventoryModel> addMedicine({
    required int medicineId,
    required int quantity,
    required DateTime expiryDate,
  });

  Future<void> transferOrder({required int orderId});

  Future<List<InventoryModel>> getMainInventory();
}
