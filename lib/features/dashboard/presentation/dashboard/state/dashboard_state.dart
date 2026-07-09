import 'package:pharma_link_supplier/features/dashboard/domain/entity/dashboard_entity.dart';

abstract class DashboardState {}

class DashboardInitialState extends DashboardState {}

class DashboardLoadingState extends DashboardState {}

class DashboardLoadedState extends DashboardState {
  final DashboardEntity dashboardData;

  DashboardLoadedState({required this.dashboardData});
}

class DashboardErrorState extends DashboardState {
  final String error;

  DashboardErrorState({required this.error});
}
