import '../../domain/entity/order_entity.dart';
import '../../domain/repository/order_repository.dart';
import '../datasource/order_remote_datasource.dart';

class OrderRepositoryImpl extends OrderRepository {
  final OrderRemoteDatasource orderRemoteDatasource;

  OrderRepositoryImpl({required this.orderRemoteDatasource});

  @override
  Future<OrderEntity> getOrderById({required int orderId}) async {
    final model = await orderRemoteDatasource.getOrderById(orderId: orderId);
    return model.toEntity();
  }

  @override
  Future<List<OrderEntity>> getOrders() async {
    final model = await orderRemoteDatasource.getOrders();
    return model.map((order) => order.toEntity()).toList();
  }

  @override
  Future<void> updateStatus({required int orderId, required int status}) async {
    await orderRemoteDatasource.updateStatus(orderId: orderId, status: status);
  }
}
