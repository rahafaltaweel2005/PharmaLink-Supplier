import '../repository/order_repository.dart';

 class UpdateStatusUseCase {
  final OrderRepository orderRepository;

  UpdateStatusUseCase({required this.orderRepository});

  Future<void> call({required int orderId, required int status}){
    return orderRepository.updateStatus(orderId: orderId, status: status);
  }
}
