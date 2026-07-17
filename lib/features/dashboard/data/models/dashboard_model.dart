import 'package:pharma_link_supplier/features/dashboard/domain/entity/dashboard_entity.dart';

class DashboardModel {
  int? totalPharmacies;
  int? totalMedicines;
  int? totalSuppliers;
  int? totalOrders;
  int? totalInventory;
  int? totalPendingOrders;

  DashboardModel({
    this.totalPharmacies,
    this.totalMedicines,
    this.totalSuppliers,
    this.totalOrders,
    this.totalInventory,
    this.totalPendingOrders,
  });

  DashboardModel.fromJson(Map<String, dynamic> json) {
    totalPharmacies = json['totalPharmacies'];
    totalMedicines = json['totalMedicines'];
    totalSuppliers = json['totalSuppliers'];
    totalOrders = json['totalOrders'];
    totalInventory = json['totalInventory'];
    totalPendingOrders = json['totalPendingOrders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalPharmacies'] = totalPharmacies;
    data['totalMedicines'] = totalMedicines;
    data['totalSuppliers'] = totalSuppliers;
    data['totalOrders'] = totalOrders;
    data['totalInventory'] = totalInventory;
    data['totalPendingOrders'] = totalPendingOrders;
    return data;
  }

  DashboardEntity toEntity() {
    return DashboardEntity(
      totalPharmacies: totalPharmacies!,
      totalMedicines: totalMedicines!,
      totalSuppliers: totalSuppliers!,
      totalOrders: totalOrders!,
      totalInventory: totalInventory!,
      totalPendingOrders: totalPendingOrders!,
    );
  }
}
