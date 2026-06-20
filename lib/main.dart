import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_link_supplier/features/auth/presentation/login/view/login_screen.dart';
import 'package:pharma_link_supplier/features/inventory/data/datasource/inventory_remote_datasource_impl.dart';
import 'package:pharma_link_supplier/features/inventory/presentation/addMedicine/cubit/add_medicine_cubit.dart';
import 'package:pharma_link_supplier/features/inventory/presentation/getMainInventory/cubit/get_main_inventory_cubit.dart';
import 'package:pharma_link_supplier/features/inventory/presentation/getMainInventory/view/get_main_inventory_screen.dart';
import 'package:pharma_link_supplier/features/order/domain/usecase/update_status_use_case.dart';
import 'package:pharma_link_supplier/features/order/presentation/updateStatus/cubit/update_status_cubit.dart';
import 'core/app_setting/theme/app_theme.dart';
import 'core/network/api_client.dart';
import 'features/auth/data/datasource/auth_remote_datasource_impl.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/domain/usecase/login_use_case.dart';
import 'features/auth/presentation/login/cubit/login_cubit.dart';
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
import 'features/medicine/presentation/getMedicine/view/get_medicines_screen.dart';
import 'features/medicine/presentation/getMedicineById/cubit/get_medicine_by_id_cubit.dart';
import 'features/order/data/datasource/order_remote_datasource_impl.dart';
import 'features/order/data/repository/order_repository_impl.dart';
import 'features/order/domain/usecase/get_order_by_id_use_case.dart';
import 'features/order/domain/usecase/get_orders_use_case.dart';
import 'features/order/presentation/getMyOrder/cubit/get_my_order_cubit.dart';
import 'features/order/presentation/getOrderById/cubit/get_order_by_id_cubit.dart';

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
  final orderRemoteDatasource = OrderRemoteDatasourceImpl();

  final orderRepository = OrderRepositoryImpl(
    orderRemoteDatasource: orderRemoteDatasource,
  );
  final inventoryRemoteDatasource = InventoryRemoteDatasourceImpl();

  final inventoryRepository = InventoryRepositoryImpl(
    inventoryRemoteDatasource: inventoryRemoteDatasource,
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
  final getOrdersUseCase = GetOrdersUseCase(orderRepository: orderRepository);
  final getOrderByIdUseCase = GetOrderByIdUseCase(
    orderRepository: orderRepository,
  );
  final updateStatusUseCase = UpdateStatusUseCase(
    orderRepository: orderRepository,
  );
  final getMainInventoryUseCase = GetMainInventoryUseCase(
    inventoryRepository: inventoryRepository,
  );
  final addMedicineUseCase = AddMedicineUseCase(
    inventoryRepository: inventoryRepository,
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
        ),BlocProvider(
          create: (_) => AddMedicineCubit(
            addMedicineUseCase: addMedicineUseCase,
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
      home: LoginScreen(),
    );
  }
}
