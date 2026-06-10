import 'medicine_type.dart';

class MedicineEntity {
  final int id;
  final String name;
  final String imageUrl;
  final String? description;
  final double price;
  final MedicineType type;

  MedicineEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.description,
    required this.price,
    required this.type,
  });
}
