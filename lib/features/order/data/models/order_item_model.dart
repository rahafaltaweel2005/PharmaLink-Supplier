import '../../domain/entity/order_item_entity.dart';

class  OrderItemModel {
  int? medicineId;
  String? medicineName;
  int? quantity;
  double? unitPrice;

  OrderItemModel({this.medicineId, this.medicineName, this.quantity, this.unitPrice});

  OrderItemModel.fromJson(Map<String, dynamic> json) {
    medicineId = json['medicineId'];
    medicineName = json['medicineName'];
    quantity = json['quantity'];
    unitPrice = json['unitPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medicineId'] = medicineId;
    data['medicineName'] = medicineName;
    data['quantity'] = quantity;
    data['unitPrice'] = unitPrice;
    return data;
  }
  OrderItemEntity toEntity() {
    return OrderItemEntity(
      medicineId: medicineId!,
      medicineName: medicineName!,
      quantity: quantity!,
      unitPrice: unitPrice!,
    );
  }
}


