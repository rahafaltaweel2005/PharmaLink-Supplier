import '../entity/order_entity.dart';
import '../repository/order_repository.dart';

class GetOrdersUseCase {
  final OrderRepository orderRepository;

  GetOrdersUseCase({required this.orderRepository});

  Future<List<OrderEntity>> call() {
    return orderRepository.getOrders();
  }
}
