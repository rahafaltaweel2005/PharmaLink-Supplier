import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_link_supplier/features/pharmacy/domain/usecase/get_pharmacy_by_id_use_case.dart';

import '../state/get_pharmacy_by_id_state.dart';

class GetPharmacyByIdCubit extends Cubit<GetPharmacyByIdState> {
  final GetPharmacyByIdUseCase getPharmacyByIdUseCase;

  GetPharmacyByIdCubit({required this.getPharmacyByIdUseCase})
    : super(GetPharmacyInitialState());

  Future<void> getPharmacyById(int id) async {
    emit(GetPharmacyLoadingState());

    try {
      final result = await getPharmacyByIdUseCase(id: id);
      emit((GetPharmacyLoadedState(pharmacy: result)));
    } catch (error) {
      emit(GetPharmacyErrorState(error: error.toString()));
    }
  }
}
