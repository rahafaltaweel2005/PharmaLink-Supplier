
import '../../../domain/entity/order_entity.dart';

abstract class GetMyOrderState {}

class GetMyOrderInitialState extends GetMyOrderState {}

class GetMyOrderLoadingState extends GetMyOrderState {}

class GetMyOrderLoadedState extends GetMyOrderState {
  final List<OrderEntity> orders;

  GetMyOrderLoadedState({required this.orders});
}

class GetMyOrderErrorState extends GetMyOrderState {
  final String error;

  GetMyOrderErrorState({required this.error});
}
