import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_link_supplier/features/auth/domain/usecase/get_profile_use_case.dart';
import 'package:pharma_link_supplier/features/auth/presentation/login/view/login_screen.dart';
import 'package:pharma_link_supplier/features/dashboard/data/datasource/Dashboard_remote_datasource_impl.dart';
import 'package:pharma_link_supplier/features/dashboard/data/repository/dashboard_repository_impl.dart';
import 'package:pharma_link_supplier/features/dashboard/domain/usecase/get_dashboard_use_case.dart';
import 'package:pharma_link_supplier/features/dashboard/presentation/dashboard/cubit/dashboard_cubit.dart';
import 'package:pharma_link_supplier/features/inventory/data/datasource/inventory_remote_datasource_impl.dart';
import 'package:pharma_link_supplier/features/inventory/presentation/addMedicine/cubit/add_medicine_cubit.dart';
import 'package:pharma_link_supplier/features/inventory/presentation/getMainInventory/cubit/get_main_inventory_cubit.dart';
import 'package:pharma_link_supplier/features/order/domain/usecase/update_status_use_case.dart';
import 'package:pharma_link_supplier/features/order/presentation/updateStatus/cubit/update_status_cubit.dart';
import 'package:pharma_link_supplier/features/pharmacy/data/datasource/pharmacy_remote_datasource_impl.dart';
import 'package:pharma_link_supplier/features/pharmacy/data/repository/pharmacy_repository_impl.dart';
import 'package:pharma_link_supplier/features/pharmacy/domain/usecase/get_pharmacies_use_case.dart';
import 'package:pharma_link_supplier/features/pharmacy/domain/usecase/get_pharmacy_by_id_use_case.dart';
import 'package:pharma_link_supplier/features/pharmacy/domain/usecase/update_status_pharmacy_use_case.dart';
import 'package:pharma_link_supplier/features/pharmacy/presentation/updateStatusPharmacy/cubit/update_status_pharmacy_cubit.dart';
import 'core/app_setting/theme/app_theme.dart';
import 'core/network/api_client.dart';
import 'features/auth/data/datasource/auth_remote_datasource_impl.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/domain/usecase/login_use_case.dart';
import 'features/auth/domain/usecase/logout_use_case.dart';
import 'features/auth/domain/usecase/register_use_case.dart';
import 'features/auth/presentation/login/cubit/login_cubit.dart';
import 'features/auth/presentation/logout/cubit/logout_cubit.dart';
import 'features/auth/presentation/profile/cubit/profile_cubit.dart';
import 'features/auth/presentation/register/cubit/register_cubit.dart';
import 'features/inventory/data/repository/inventory_repository_impl.dart';
import 'features/inventory/domain/usecase/add_medicine_use_case.dart';
import 'features/inventory/domain/usecase/get_main_inventory_use_case.dart';
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
import 'features/medicine/presentation/getMedicineById/cubit/get_medicine_by_id_cubit.dart';
import 'features/order/data/datasource/order_remote_datasource_impl.dart';
import 'features/order/data/repository/order_repository_impl.dart';
import 'features/order/domain/usecase/get_order_by_id_use_case.dart';
import 'features/order/domain/usecase/get_orders_use_case.dart';
import 'features/order/presentation/getMyOrder/cubit/get_my_order_cubit.dart';
import 'features/order/presentation/getOrderById/cubit/get_order_by_id_cubit.dart';
import 'features/pharmacy/presentation/getPharmacies/cubit/get_pharmacies_cubit.dart';
import 'features/pharmacy/presentation/getPharmacyById/cubit/get_pharmacy_by_id_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApiClient.init();

  final authRemoteDatasource = AuthRemoteDatasourceImpl();
  final authRepository = AuthRepositoryImpl(
    authRemoteDatasource: authRemoteDatasource,
  );

  final loginUseCase = LoginUseCase(authRepository: authRepository);
  final logoutUseCase = LogoutUseCase(authRepository: authRepository);
  final registerUsecase = RegisterUseCase(authRepository: authRepository);
  final profileUsecase = GetProfileUseCase(authRepository: authRepository);

  final medicineRemoteDatasource = MedicineRemoteDatasourceImpl();
  final medicineRepository = MedicineRepositoryImpl(
    medicineRemoteDatasource: medicineRemoteDatasource,
  );

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

  final orderRemoteDatasource = OrderRemoteDatasourceImpl();
  final orderRepository = OrderRepositoryImpl(
    orderRemoteDatasource: orderRemoteDatasource,
  );

  final getOrdersUseCase = GetOrdersUseCase(orderRepository: orderRepository);
  final getOrderByIdUseCase = GetOrderByIdUseCase(
    orderRepository: orderRepository,
  );
  final updateStatusUseCase = UpdateStatusUseCase(
    orderRepository: orderRepository,
  );

  final inventoryRemoteDatasource = InventoryRemoteDatasourceImpl();

  final inventoryRepository = InventoryRepositoryImpl(
    inventoryRemoteDatasource: inventoryRemoteDatasource,
  );

  final getMainInventoryUseCase = GetMainInventoryUseCase(
    inventoryRepository: inventoryRepository,
  );
  final addMedicineUseCase = AddMedicineUseCase(
    inventoryRepository: inventoryRepository,
  );
  final pharmacyRemoteDatasource = PharmacyRemoteDatasourceImpl();

  final pharmacyRepository = PharmacyRepositoryImpl(
    pharmacyRemoteDatasource: pharmacyRemoteDatasource,
  );

  final getPharmaciesUseCase = GetPharmaciesUseCase(
    pharmacyRepository: pharmacyRepository,
  );
  final getPharmacyByIdUseCase = GetPharmacyByIdUseCase(
    pharmacyRepository: pharmacyRepository,
  );
  final updateStatusPharmacyUseCase = UpdateStatusPharmacyUseCase(
    pharmacyRepository: pharmacyRepository,
  );

  final dashboardRemoteDatasource = DashboardRemoteDatasourceImpl();

  final dashboardRepository = DashboardRepositoryImpl(
    dashboardRemoteDatasource: dashboardRemoteDatasource,
  );

  final getDashboardUseCase = GetDashboardUseCase(
    dashboardRepository: dashboardRepository,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit(loginUseCase: loginUseCase)),
        BlocProvider(create: (_) => LogoutCubit(logoutUseCase: logoutUseCase)),
        BlocProvider(
          create: (_) => RegisterCubit(registerUseCase: registerUsecase),
        ),
        BlocProvider(
          create: (_) => ProfileCubit(getProfileUseCase: profileUsecase),
        ),
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
          create: (_) =>
              EditMedicineCubit(updateMedicineUseCase: updateMedicineUseCase),
        ),
        BlocProvider(
          create: (_) =>
              CreateMedicineCubit(createMedicineUseCase: createMedicineUseCase),
        ),
        BlocProvider(
          create: (_) =>
              DeleteMedicineCubit(deleteMedicineUseCase: deleteMedicineUseCase),
        ),
        BlocProvider(
          create: (_) => GetMyOrderCubit(getOrdersUseCase: getOrdersUseCase),
        ),
        BlocProvider(
          create: (_) =>
              GetOrderByIdCubit(getOrderByIdUseCase: getOrderByIdUseCase),
        ),
        BlocProvider(
          create: (_) =>
              UpdateStatusCubit(updateStatusUseCase: updateStatusUseCase),
        ),
        BlocProvider(
          create: (_) => GetMainInventoryCubit(
            getMainInventoryUseCase: getMainInventoryUseCase,
          ),
        ),
        BlocProvider(
          create: (_) =>
              AddMedicineCubit(addMedicineUseCase: addMedicineUseCase),
        ),
        BlocProvider(
          create: (_) =>
              DashboardCubit(getDashboardUseCase: getDashboardUseCase),
        ),
        BlocProvider(
          create: (_) => GetPharmacyByIdCubit(
            getPharmacyByIdUseCase: getPharmacyByIdUseCase,
          ),
        ),
        BlocProvider(
          create: (_) =>
            GetPharmaciesCubit(getPharmaciesUseCase: getPharmaciesUseCase)
        ),
        BlocProvider(
          create: (_) =>
             UpdateStatusPharmacyCubit(updateStatusPharmacyUseCase: updateStatusPharmacyUseCase)
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
      home: LoginScreen(),
    );
  }
}
