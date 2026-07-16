import 'package:pharma_link_supplier/features/pharmacy/domain/entity/pharmacy_entity.dart';
import 'package:pharma_link_supplier/features/pharmacy/domain/entity/pharmacy_status.dart';

class PharmacyModel {
  int? id;
  String? name;
  String? address;
  String? licenseNumber;
  String? phoneNumber;
  String? email;
  int? status;
  int? userId;
  String? userName;
  int? orderCount;
  int? pharmacyInventories;

  PharmacyModel(
      {this.id,
        this.name,
        this.address,
        this.licenseNumber,
        this.phoneNumber,
        this.email,
        this.status,
        this.userId,
        this.userName,
        this.orderCount,
        this.pharmacyInventories});

  PharmacyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    licenseNumber = json['licenseNumber'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    status = json['status'];
    userId = json['userId'];
    userName = json['userName'];
    orderCount = json['orderCount'];
    pharmacyInventories = json['pharmacyInventories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['licenseNumber'] = licenseNumber;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['status'] = status;
    data['userId'] = userId;
    data['userName'] = userName;
    data['orderCount'] = orderCount;
    data['pharmacyInventories'] = pharmacyInventories;
    return data;
  }
  PharmacyEntity toEntity() {
    return PharmacyEntity(
      id: id!,
      userId: userId!,
      name: name!,
      phoneNumber: phoneNumber!,
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
