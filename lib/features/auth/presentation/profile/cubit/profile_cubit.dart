import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_link_supplier/features/auth/domain/usecase/get_profile_use_case.dart';
import 'package:pharma_link_supplier/features/auth/presentation/profile/state/profile_state.dart';

import '../../../../../core/constant/app_const.dart';
import '../../../../../core/storage/secure_storage_helper.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;

  ProfileCubit({required this.getProfileUseCase})
    : super(ProfileInitialState());

  Future<void> profile() async {
    emit(ProfileLoadingState());
    final token = await SecureStorageHelper.read(
      key: AppConst.accessTokenKey,
    );


    try {
      final profile = await getProfileUseCase();
      emit(ProfileLoadedState(profileResponse: profile));
    } catch (error) {
      emit(ProfileErrorState(error: error.toString()));
    }
  }
}
