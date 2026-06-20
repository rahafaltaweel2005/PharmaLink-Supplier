import 'package:pharma_link_supplier/features/order/domain/entity/status_order.dart';

import 'order_item_entity.dart';

class OrderEntity {
  final int orderId;
  final DateTime orderDate;
  final DateTime? deliveryTime;
  final String? notes;
  final String? doctorName;
  final double totalPrice;
  final StatusOrder status;
  final List<OrderItemEntity> orderItems;

  OrderEntity({
    required this.orderId,
    required this.orderDate,
    this.notes,
    required this.deliveryTime,
    required this.doctorName,
    required this.totalPrice,
    required this.status,
    required this.orderItems,
  });
}
