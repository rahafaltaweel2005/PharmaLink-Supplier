import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/get_orders_use_case.dart';
import '../state/get_my_order_state.dart';


class GetMyOrderCubit extends Cubit<GetMyOrderState> {
  final GetOrdersUseCase getOrdersUseCase;

  GetMyOrderCubit({required this.getOrdersUseCase})
    : super(GetMyOrderInitialState());

  Future<void> getOrders() async {
    emit(GetMyOrderLoadingState());
    try {
      final order = await getOrdersUseCase();
      emit(GetMyOrderLoadedState(orders: order));
    } catch (error) {
      emit(GetMyOrderErrorState(error: error.toString()));
    }
  }
}
