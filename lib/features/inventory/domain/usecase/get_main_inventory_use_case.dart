
import 'package:pharma_link_supplier/features/inventory/domain/entity/inventory_entity.dart';

import '../repository/inventory_repository.dart';

class GetMainInventoryUseCase {
  final InventoryRepository inventoryRepository;

  GetMainInventoryUseCase({required this.inventoryRepository});

  Future<List<InventoryEntity>> call() {
    return inventoryRepository.getMainInventory();
  }
}
