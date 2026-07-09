import '../models/dashboard_model.dart';

abstract class DashboardRemoteDatasource {
  Future<DashboardModel> getDashboard();
}
