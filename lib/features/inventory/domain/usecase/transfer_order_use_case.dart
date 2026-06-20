import 'package:pharma_link_supplier/features/inventory/domain/repository/inventory_repository.dart';

class TransferOrderUseCase {
  final InventoryRepository inventoryRepository;

  TransferOrderUseCase({required this.inventoryRepository});

  Future<void> call({required int orderId}) {
    return inventoryRepository.transferOrder(orderId: orderId);
  }
}
