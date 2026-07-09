import 'package:pharma_link_supplier/features/auth/domain/entity/profile_entity.dart';

import '../../../domain/entity/auth_response_entity.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final ProfileEntity profileResponse;

  ProfileLoadedState({required this.profileResponse});
}

class ProfileErrorState extends ProfileState {
  final String error;

  ProfileErrorState({required this.error});
}
