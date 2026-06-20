import 'package:pharma_link_supplier/features/inventory/domain/entity/inventory_entity.dart';

class InventoryModel {
  int? id;
  int? medicineId;
  String? medicineName;
  int? quantity;
  String? expiryDate;

  InventoryModel({
    this.id,
    this.medicineId,
    this.medicineName,
    this.quantity,
    this.expiryDate,
  });

  InventoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    medicineId = json['medicineId'];
    medicineName = json['medicineName'];
    quantity = json['quantity'];
    expiryDate = json['expiryDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['medicineId'] = this.medicineId;
    data['medicineName'] = this.medicineName;
    data['quantity'] = this.quantity;
    data['expiryDate'] = this.expiryDate;
    return data;
  }
  InventoryEntity toEntity() {
    return InventoryEntity(
      id: id!,
      medicineId: medicineId!,
      expiryDate: DateTime.parse(expiryDate!),
      medicineName: medicineName!,
      quantity: quantity!,
    );
  }
}


