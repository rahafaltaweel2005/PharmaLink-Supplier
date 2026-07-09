
import '../entity/dashboard_entity.dart';
import '../repository/dashboard_repository.dart';

class GetDashboardUseCase {
  final DashboardRepository dashboardRepository;

  GetDashboardUseCase({required this.dashboardRepository});

  Future<DashboardEntity> call() {
    return dashboardRepository.getDashboard();
  }
}
