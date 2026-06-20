abstract class UpdateStatusState {}

class UpdateStatusInitialState extends UpdateStatusState {}

class UpdateStatusLoadingState extends UpdateStatusState {}

class UpdateStatusSuccessState extends UpdateStatusState {}

class UpdateStatusErrorState extends UpdateStatusState {
  final String error;

  UpdateStatusErrorState({required this.error});
}
