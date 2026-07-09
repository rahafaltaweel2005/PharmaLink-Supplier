import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/get_order_by_id_use_case.dart';
import '../state/get_order_by_id_state.dart';



class GetOrderByIdCubit extends Cubit<GetOrderByIdState> {
  final GetOrderByIdUseCase getOrderByIdUseCase;

  GetOrderByIdCubit({required this.getOrderByIdUseCase})
    : super(GetOrderByIdInitialState());

  Future<void> getOrderById(int id) async {
    emit(GetOrderByIdLoadingState());

    try {
      final result = await getOrderByIdUseCase(orderId: id);
      emit((GetOrderByIdLoadedState(order: result)));
    } catch (error) {
      emit(GetOrderByIdErrorState(error: error.toString()));
    }
  }
}
