import 'package:dio/dio.dart';

import '../../../../core/constant/api_const.dart';
import '../../../../core/network/api_client.dart';
import '../../domain/entity/medicine_type.dart';
import '../models/medicine_model.dart';
import 'medicine_remote_datasource.dart';

class MedicineRemoteDatasourceImpl extends MedicineRemoteDatasource {
  @override
  Future<MedicineModel> createMedicine({
    required String name,
    required String imageUrl,
    String? description,
    required double price,
    required MedicineType type,
  }) async {
    final formData = FormData.fromMap({
      'name': name,
      'imageUrl': await MultipartFile.fromFile(
        imageUrl,
        filename: imageUrl
            .split('/')
            .last,
      ),
      'description': description,
      'price': price,
      'type': _medicineTypeToInt(type),
    });

    final response = await ApiClient.post(
      endpoint: ApiConst.medicine,
      data: formData,
      options: Options(
        contentType: 'multipart/form-data',
      ),
    );
    return MedicineModel.fromJson(response.data);
  }

  @override
  Future<void> deleteMedicine({required int id}) async {
    await ApiClient.delete(endpoint: ApiConst.medicineById(id));
  }

  @override
  Future<MedicineModel> getMedicineById({required int id}) async {
    final response = await ApiClient.get(endpoint: ApiConst.medicineById(id));
    return MedicineModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<List<MedicineModel>> getMedicines() async {
    final response = await ApiClient.get(endpoint: ApiConst.medicine);
    final data = response.data as List;
    return data
        .map(
          (medicine) =>
          MedicineModel.fromJson(medicine as Map<String, dynamic>),
    )
        .toList();
  }

  @override
  Future<void> updateMedicine({
    required int id,
    required String name,
    required String imageUrl,
    String? description,
    required double price,
    required MedicineType type,
  }) async {
    print('UPDATE API');
    print('IMAGE = $imageUrl');

    final formData = FormData.fromMap({
      'id' : id,
      'name': name,
      'description': description,
      'price': price,
      'type': _medicineTypeToInt(type),
    });
    if(!imageUrl.startsWith('http')){
      formData.files.add(
        MapEntry(
          'imageUrl',
          await MultipartFile.fromFile(
            imageUrl,
            filename: imageUrl.split('/').last,
          ),
        ),
      );
    }
    await ApiClient.put(
      endpoint: ApiConst.medicineById(id),
      data: formData,
      options: Options(
        contentType: 'multipart/form-data',
      ),
    );
  }

  int _medicineTypeToInt(MedicineType type) {
    switch (type) {
      case MedicineType.antibiotic:
        return 0;

      case MedicineType.painkiller:
        return 1;

      case MedicineType.vitamin:
        return 2;

      case MedicineType.diabetes:
        return 3;

      case MedicineType.cardiac:
        return 4;

      case MedicineType.respiratory:
        return 5;

      case MedicineType.gastrointestinal:
        return 6;

      case MedicineType.dermatology:
        return 7;
    }
  }
}
