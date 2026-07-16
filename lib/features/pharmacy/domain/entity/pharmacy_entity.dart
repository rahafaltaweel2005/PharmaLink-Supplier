import 'package:pharma_link_supplier/features/pharmacy/domain/entity/pharmacy_status.dart';

class PharmacyEntity {
  final int id;
  final int userId;
  final String name;
  final String userName;
  final String phoneNumber;
  final int pharmacyInventories;
  final String licenseNumber;
  final String address;
  final String email;
  final int orderCount;
  final PharmacyStatus status;

  PharmacyEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.orderCount,
    required this.status,
    required this.pharmacyInventories,
    required this.userName,
    required this.licenseNumber,
  });
}
