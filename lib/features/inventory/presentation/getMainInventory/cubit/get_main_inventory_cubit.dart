import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_link_supplier/features/inventory/domain/usecase/get_main_inventory_use_case.dart';
import 'package:pharma_link_supplier/features/inventory/presentation/getMainInventory/state/get_main_inventory_state.dart';

class GetMainInventoryCubit extends Cubit<GetMainInventoryState> {
  final GetMainInventoryUseCase getMainInventoryUseCase;

  GetMainInventoryCubit({required this.getMainInventoryUseCase})
    : super(GetMainInventoryInitialState());

  Future<void> getMainInventory() async {
    emit(GetMainInventoryLoadingState());
    try {
      final inventory = await getMainInventoryUseCase();
      emit(GetMainInventoryLoadedState(inventory: inventory));
    } catch (error) {
      emit(GetMainInventoryErrorState(error: error.toString()));
    }
  }
}
