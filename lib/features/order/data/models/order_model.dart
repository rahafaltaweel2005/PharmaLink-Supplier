

import '../../domain/entity/order_entity.dart';
import '../../domain/entity/status_order.dart';
import 'order_item_model.dart';

class OrderModel {
  int? orderId;
  String? orderName;
  String? notes;
  String? orderDate;
  String? deliveryTime;
  int? status;
  double? totalPrice;
  String? pharmacyName;
  List<OrderItemModel>? orderItems;

  OrderModel({
    this.orderId,
    this.notes,
    this.orderDate,
    this.deliveryTime,
    this.status,
    this.totalPrice,
    this.pharmacyName,
    this.orderItems,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    notes = json['notes'];
    orderDate = json['orderDate'];
    deliveryTime = json['deliveryTime'];
    status = json['status'];
    totalPrice = json['totalPrice'];
    pharmacyName = json['pharmacyName'];
    if (json['orderItems'] != null) {
      orderItems = <OrderItemModel>[];
      json['orderItems'].forEach((v) {
        orderItems!.add(new OrderItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['notes'] = this.notes;
    data['orderDate'] = this.orderDate;
    data['deliveryTime'] = this.deliveryTime;
    data['status'] = this.status;
    data['totalPrice'] = this.totalPrice;
    data['pharmacyName'] = this.pharmacyName;
    if (this.orderItems != null) {
      data['orderItems'] = this.orderItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  OrderEntity toEntity() {
    return OrderEntity(
      orderId: orderId!,
      orderDate: DateTime.parse(orderDate!),
      notes: notes,
      deliveryTime: deliveryTime != null ? DateTime.parse(deliveryTime!) : null,
      pharmacyName: pharmacyName ?? "",
      totalPrice: totalPrice!,
      status: _status(status!),
      orderItems: orderItems!.map((item) => item.toEntity()).toList(),
    );
  }

  StatusOrder _status(int status) {
    switch (status) {
      case 0:
        return StatusOrder.pending;
      case 1:
        return StatusOrder.accepted;

      case 2:
        return StatusOrder.preparing;

      case 3:
        return StatusOrder.inTransit;

      case 4:
        return StatusOrder.delivered;

      case 5:
        return StatusOrder.cancelled;

      default:
        throw Exception('Invalid status order');
    }
  }
}
