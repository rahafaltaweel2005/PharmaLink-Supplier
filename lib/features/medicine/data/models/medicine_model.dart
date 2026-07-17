import '../../domain/entity/medicine_entity.dart';
import '../../domain/entity/medicine_type.dart';

 class MedicineModel {
  int? id;
  String? imageUrl;
  String? name;
  String? description;
  double? price;
  int? type;

  MedicineModel({
    this.id,
    this.imageUrl,
    this.name,
    this.description,
    this.price,
    this.type,
  });

  MedicineModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    description = json['description'];
    price = (json['price'] as num).toDouble();
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['type'] = type;
    return data;
  }

  MedicineEntity toEntity() {
    return MedicineEntity(id: id!,
        name: name!,
        imageUrl: imageUrl!,
        description:description,
        price: price!,
        type: _medicineType(type!));
  }

  MedicineType _medicineType(int type) {
    switch (type) {
      case 0:
        return MedicineType.antibiotic;

      case 1:
        return MedicineType.painkiller;

      case 2:
        return MedicineType.vitamin;

      case 3:
        return MedicineType.diabetes;

      case 4:
        return MedicineType.cardiac;

      case 5:
        return MedicineType.respiratory;

      case 6:
        return MedicineType.gastrointestinal;

      case 7:
        return MedicineType.dermatology;

      default:
        throw Exception('Invalid medicine type');
    }
  }

}
