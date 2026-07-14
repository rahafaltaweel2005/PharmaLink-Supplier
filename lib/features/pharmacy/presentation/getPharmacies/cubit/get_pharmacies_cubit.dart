import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_link_supplier/features/pharmacy/domain/usecase/get_pharmacies_use_case.dart';

import '../state/get_pharmacies_state.dart';

class GetPharmaciesCubit extends Cubit<GetPharmaciesState> {
  final GetPharmaciesUseCase getPharmaciesUseCase;

  GetPharmaciesCubit({required this.getPharmaciesUseCase})
    : super(GetPharmaciesInitialState());

  Future<void> getPharmacies() async {
    emit(GetPharmaciesLoadingState());
    try {
      final pharmacy = await getPharmaciesUseCase();
      emit(GetPharmaciesLoadedState(pharmacy: pharmacy));
    } catch (error) {
      emit(GetPharmaciesErrorState(error: error.toString()));
    }
  }
}
