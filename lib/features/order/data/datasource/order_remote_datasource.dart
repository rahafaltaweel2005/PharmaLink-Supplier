
import '../models/order_model.dart';

abstract class OrderRemoteDatasource {
  Future<OrderModel> getOrderById({required int orderId});

  Future<void> updateStatus({required int orderId , required int status});

  Future<List<OrderModel>> getOrders();
}
