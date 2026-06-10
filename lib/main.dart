import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/app_setting/theme/app_theme.dart';
import 'core/network/api_client.dart';
import 'features/auth/data/datasource/auth_remote_datasource_impl.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/domain/usecase/login_use_case.dart';
import 'features/auth/presentation/login/cubit/login_cubit.dart';
import 'features/medicine/data/datasource/medicine_remote_datasource_impl.dart';
import 'features/medicine/data/repository/medicine_repository_impl.dart';
import 'features/medicine/domain/usecase/create_medicine_use_case.dart';
import 'features/medicine/domain/usecase/delete_medicine_use_case.dart';
import 'features/medicine/domain/usecase/get_medicine_by_id_use_case.dart';
import 'features/medicine/domain/usecase/get_medicines_use_case.dart';
import 'features/medicine/domain/usecase/update_medicine_use_case.dart';
import 'features/medicine/presentation/createMedicine/cubit/create_medicine_cubit.dart';
import 'features/medicine/presentation/deleteMedicine/cubit/delete_medicine_cubit.dart';
import 'features/medicine/presentation/editMedicine/cubit/edit_medicine_cubit.dart';
import 'features/medicine/presentation/getMedicine/cubit/get_medicine_cubit.dart';
import 'features/medicine/presentation/getMedicine/view/get_medicines_screen.dart';
import 'features/medicine/presentation/getMedicineById/cubit/get_medicine_by_id_cubit.dart';
import 'features/splash/presentation/view/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApiClient.init();

  final authRemoteDatasource = AuthRemoteDatasourceImpl();
  final authRepository = AuthRepositoryImpl(
    authRemoteDatasource: authRemoteDatasource,
  );
  final medicineRemoteDatasource = MedicineRemoteDatasourceImpl();
  final medicineRepository = MedicineRepositoryImpl(
    medicineRemoteDatasource: medicineRemoteDatasource,
  );
  final loginUseCase = LoginUseCase(authRepository: authRepository);
  final getMedicinesUseCase = GetMedicinesUseCase(
    medicineRepository: medicineRepository,
  );
  final getMedicineByIdUseCase = GetMedicineByIdUseCase(
    medicineRepository: medicineRepository,
  );
  final updateMedicineUseCase = UpdateMedicineUseCase(
    medicineRepository: medicineRepository,
  );
  final createMedicineUseCase = CreateMedicineUseCase(
    medicineRepository: medicineRepository,
  );
  final deleteMedicineUseCase = DeleteMedicineUseCase(
    medicineRepository: medicineRepository,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit(loginUseCase: loginUseCase)),
        BlocProvider(
          create: (_) =>
              GetMedicineCubit(getMedicinesUseCase: getMedicinesUseCase),
        ),
        BlocProvider(
          create: (_) => GetMedicineByIdCubit(
            getMedicineByIdUseCase: getMedicineByIdUseCase,
          ),
        ),
        BlocProvider(
          create: (_) => EditMedicineCubit(
            updateMedicineUseCase: updateMedicineUseCase,
          ),
        ), BlocProvider(
          create: (_) => CreateMedicineCubit(
            createMedicineUseCase:createMedicineUseCase,
          ),
        ),
        BlocProvider(
          create: (_) => DeleteMedicineCubit(
            deleteMedicineUseCase:deleteMedicineUseCase,
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: GetMedicinesScreen(),
    );
  }
}
