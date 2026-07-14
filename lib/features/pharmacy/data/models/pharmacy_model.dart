import 'package:pharma_link_supplier/features/pharmacy/domain/entity/pharmacy_entity.dart';
import 'package:pharma_link_supplier/features/pharmacy/domain/entity/pharmacy_status.dart';

class PharmacyModel {
  int? id;
  String? name;
  String? address;
  String? licenseNumber;
  String? email;
  int? status;
  int? userId;
  String? userName;
  int? orderCount;
  String? pharmacyInventories;

  PharmacyModel({
    this.id,
    this.name,
    this.address,
    this.licenseNumber,
    this.email,
    this.status,
    this.userId,
    this.userName,
    this.orderCount,
    this.pharmacyInventories,
  });

  PharmacyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    licenseNumber = json['licenseNumber'];
    email = json['email'];
    status = json['status'];
    userId = json['userId'];
    userName = json['userName'];
    orderCount = json['orderCount'];
    pharmacyInventories = json['pharmacyInventories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['licenseNumber'] = this.licenseNumber;
    data['email'] = this.email;
    data['status'] = this.status;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['orderCount'] = this.orderCount;
    data['pharmacyInventories'] = this.pharmacyInventories;
    return data;
  }

  PharmacyEntity toEntity() {
    return PharmacyEntity(
      id: id!,
      userId: userId!,
      name: name!,
      address: address!,
      email: email!,
      orderCount: orderCount!,
      status: _pharmacyStatus(status!),
      pharmacyInventories: pharmacyInventories!,
      userName: userName!,
      licenseNumber: licenseNumber!,
    );
  }

  PharmacyStatus _pharmacyStatus(int status) {
    switch (status) {
      case 0:
        return PharmacyStatus.pending;

      case 1:
        return PharmacyStatus.approved;

      case 2:
        return PharmacyStatus.rejected;

      default:
        throw Exception('Invalid status');
    }
  }
}
