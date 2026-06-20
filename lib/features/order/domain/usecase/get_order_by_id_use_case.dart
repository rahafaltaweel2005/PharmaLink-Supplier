import '../entity/order_entity.dart';
import '../repository/order_repository.dart';

class GetOrderByIdUseCase {
  final OrderRepository orderRepository;

  GetOrderByIdUseCase({required this.orderRepository});

  Future<OrderEntity> call({required int orderId}) {
    return orderRepository.getOrderById(orderId: orderId);
  }
}
