class InventoryEntity {
  final int id;
  final int medicineId;
  final DateTime expiryDate;
  final String medicineName;
  final int quantity;

  InventoryEntity({
    required this.id,
    required this.medicineId,
    required this.expiryDate,
    required this.medicineName,
    required this.quantity,

  });
}
