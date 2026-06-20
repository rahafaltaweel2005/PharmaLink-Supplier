import '../entity/order_entity.dart';

abstract class OrderRepository {
  Future<OrderEntity> getOrderById({required int orderId});

  Future<void> updateStatus({required int orderId, required int status});

  Future<List<OrderEntity>> getOrders();
}
