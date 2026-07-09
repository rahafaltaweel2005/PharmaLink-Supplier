
import '../entity/dashboard_entity.dart';

abstract class  DashboardRepository{
  Future<DashboardEntity> getDashboard();
}
