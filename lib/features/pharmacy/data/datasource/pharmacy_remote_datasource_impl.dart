import 'package:pharma_link_supplier/core/constant/api_const.dart';
import 'package:pharma_link_supplier/core/network/api_client.dart';
import 'package:pharma_link_supplier/features/pharmacy/data/datasource/pharmacy_remote_datasource.dart';
import 'package:pharma_link_supplier/features/pharmacy/data/models/pharmacy_model.dart';

class PharmacyRemoteDatasourceImpl extends PharmacyRemoteDatasource {
  @override
  Future<List<PharmacyModel>> getPharmacies() async {
    final response = await ApiClient.get(endpoint: ApiConst.pharmacies);
    final data = response.data as List;
    return data
        .map(
          (pharmacy) =>
              PharmacyModel.fromJson(pharmacy as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<PharmacyModel> getPharmacyById({required int id}) async {
    final response = await ApiClient.get(endpoint: ApiConst.pharmacyById(id));
    return PharmacyModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> updateStatus({
    required int pharmacyId,
    required int status,
  }) async {
    await ApiClient.put(
      endpoint: ApiConst.updateStatusPharmacy,
      data: {'pharmacyId': pharmacyId, 'newStatus': status},
    );
  }
}
