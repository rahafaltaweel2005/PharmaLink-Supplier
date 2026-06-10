import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/get_medicines_use_case.dart';
import '../state/get_medicine_state.dart';

class GetMedicineCubit extends Cubit<GetMedicineState> {
  final GetMedicinesUseCase getMedicinesUseCase;

  GetMedicineCubit({required this.getMedicinesUseCase})
    : super(GetMedicineInitialState());

  Future<void> getMedicines() async {
    emit(GetMedicineLoadingState());
    try {
      final result = await getMedicinesUseCase();
      emit(GetMedicineLoadedState(medicines: result));
    } catch (error) {
      emit(GetMedicineErrorState(error: error.toString()));
    }
  }
}
