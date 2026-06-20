import '../../../domain/entity/inventory_entity.dart';

abstract class GetMainInventoryState {}

class GetMainInventoryInitialState extends GetMainInventoryState {}

class GetMainInventoryLoadingState extends GetMainInventoryState {}

class GetMainInventoryLoadedState extends GetMainInventoryState {
  final List<InventoryEntity> inventory;

  GetMainInventoryLoadedState({required this.inventory});
}

class GetMainInventoryErrorState extends GetMainInventoryState {
  final String error;

  GetMainInventoryErrorState({required this.error});
}
