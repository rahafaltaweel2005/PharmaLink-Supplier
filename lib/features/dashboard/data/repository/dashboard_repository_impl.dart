import 'package:pharma_link_supplier/features/dashboard/domain/entity/dashboard_entity.dart';

import '../../domain/repository/dashboard_repository.dart';
import '../datasource/Dashboard_remote_datasource.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  final DashboardRemoteDatasource dashboardRemoteDatasource;

  DashboardRepositoryImpl({required this.dashboardRemoteDatasource});

  @override
  Future<DashboardEntity> getDashboard() async {
    final model = await dashboardRemoteDatasource.getDashboard();
    return model.toEntity();
  }
}
