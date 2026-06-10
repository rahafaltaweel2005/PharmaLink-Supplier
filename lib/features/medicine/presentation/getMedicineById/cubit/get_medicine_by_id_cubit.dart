import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/get_medicine_by_id_use_case.dart';
import '../state/get_medicine_by_id_state.dart';

class GetMedicineByIdCubit extends Cubit<GetMedicineByIdState> {
  final GetMedicineByIdUseCase getMedicineByIdUseCase;

  GetMedicineByIdCubit({required this.getMedicineByIdUseCase})
    : super(GetMedicineByIdInitialState());

  Future<void> getMedicineById(int id) async {
    emit(GetMedicineByIdLoadingState());
    try {
      final result = await getMedicineByIdUseCase(id: id);
      emit(GetMedicineByIdLoadedState(medicine: result));
    } catch (error) {
      emit(GetMedicineByIdErrorState(error: error.toString()));
    }
  }
}
