import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_link_supplier/features/dashboard/presentation/dashboard/state/dashboard_state.dart';

import '../../../domain/usecase/get_dashboard_use_case.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final GetDashboardUseCase getDashboardUseCase;

  DashboardCubit({required this.getDashboardUseCase})
    : super(DashboardInitialState());

  Future<void> dashboard() async {
    emit(DashboardLoadingState());
    try {
      final dashboardData =await getDashboardUseCase();
      emit(DashboardLoadedState(dashboardData: dashboardData));
    } catch (error) {
      emit(DashboardErrorState(error: error.toString()));
    }
  }
}
