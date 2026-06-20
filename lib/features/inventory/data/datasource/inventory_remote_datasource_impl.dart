import 'package:pharma_link_supplier/core/constant/api_const.dart';
import 'package:pharma_link_supplier/core/network/api_client.dart';
import 'package:pharma_link_supplier/features/inventory/data/models/inventory_model.dart';

import 'inventory_remote_datasource.dart';

class InventoryRemoteDatasourceImpl extends InventoryRemoteDatasource {
  @override
  Future<InventoryModel> addMedicine({
    required int medicineId,
    required int quantity,
    required DateTime expiryDate,
  }) async {
    final response = await ApiClient.post(
      endpoint: ApiConst.addMedicineInInventory,
      data: {
        'medicineId': medicineId,
        'quantity': quantity,
        'expiryDate': expiryDate.toIso8601String(),
      },
    );
    return InventoryModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<List<InventoryModel>> getMainInventory() async {
    final response = await ApiClient.get(endpoint: ApiConst.mainInventory);
    final data = response.data as List;
    return data
        .map(
          (medicine) =>
              InventoryModel.fromJson(medicine as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<void> transferOrder({required int orderId}) async {
    await ApiClient.post(
      endpoint: ApiConst.transferOrder,
      data: {'orderId': orderId},
    );
  }
}
