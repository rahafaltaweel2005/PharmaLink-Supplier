import 'package:pharma_link_supplier/core/constant/api_const.dart';
import 'package:pharma_link_supplier/core/network/api_client.dart';

import '../models/dashboard_model.dart';
import 'Dashboard_remote_datasource.dart';

class DashboardRemoteDatasourceImpl extends DashboardRemoteDatasource {
  @override
  Future<DashboardModel> getDashboard() async {
    final response = await ApiClient.get(endpoint: ApiConst.dashboard);
    return DashboardModel.fromJson(response.data as Map<String, dynamic>);
  }
}
