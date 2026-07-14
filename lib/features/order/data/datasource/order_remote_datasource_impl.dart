import 'package:pharma_link_supplier/core/constant/api_const.dart';
import 'package:pharma_link_supplier/core/network/api_client.dart';

import '../models/order_model.dart';
import 'order_remote_datasource.dart';

class OrderRemoteDatasourceImpl extends OrderRemoteDatasource {
  @override
  Future<OrderModel> getOrderById({required int orderId}) async {
    final response = await ApiClient.get(endpoint: ApiConst.order(orderId));
    return OrderModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<List<OrderModel>> getOrders() async {
    final response = await ApiClient.get(endpoint: ApiConst.supplierOrder);
    final data = response.data as List;
    return data
        .map((order) => OrderModel.fromJson(order as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> updateStatus({required int orderId, required int status}) async {
    await ApiClient.put(
      endpoint: ApiConst.updateStatus,
      data: {'orderId': orderId, 'newStatus': status},
    );
  }
}
