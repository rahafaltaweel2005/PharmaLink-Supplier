import 'package:pharma_link_supplier/features/inventory/domain/entity/inventory_entity.dart';

import '../repository/inventory_repository.dart';

class AddMedicineUseCase {
  final InventoryRepository inventoryRepository;

  AddMedicineUseCase({required this.inventoryRepository});

  Future<InventoryEntity> call({
    required int medicineId,
    required int quantity,
    required DateTime expiryDate,
  }) {
    return inventoryRepository.addMedicine(
      medicineId: medicineId,
      quantity: quantity,
      expiryDate: expiryDate,
    );
  }
}
