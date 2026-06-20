class OrderItemEntity {
  final int medicineId;
  final String medicineName;
  final int quantity;
  final double unitPrice;

  OrderItemEntity({
    required this.medicineId,
    required this.medicineName,
    required this.quantity,
    required this.unitPrice,
  });
}