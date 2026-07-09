import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_link_supplier/features/dashboard/presentation/dashboard/cubit/dashboard_cubit.dart';
import 'package:pharma_link_supplier/features/dashboard/presentation/dashboard/state/dashboard_state.dart';

import '../../../../../core/constant/color_const.dart';
import '../../../../order/presentation/getMyOrder/cubit/get_my_order_cubit.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardCubit>().dashboard();
    context.read<GetMyOrderCubit>().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state is DashboardLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is DashboardErrorState) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),

              child: Text(
                state.error,
                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFB42318),
                ),
              ),
            ),
          );
        }
        if (state is DashboardLoadedState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Text(
                "Dashboard \nManage your pharmacy system",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: ColorConst.primary,
                  letterSpacing: 0.2,
                ),
              ),

              SizedBox(height: 10),
              Row(
                spacing: 10,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.all(12),
                    width: 180,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: ColorConst.border, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.025),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: ColorConst.primary.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(
                              Icons.store_outlined,
                              color: ColorConst.primary,
                              size: 28,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Total Pharmacies',

                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: ColorConst.primary.withValues(alpha: 0.4),
                              letterSpacing: 0.2,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            state.dashboardData.totalPharmacies.toString(),

                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: ColorConst.textDark,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: 180,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: ColorConst.border, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.025),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: ColorConst.primary.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(
                              Icons.local_shipping_outlined,
                              color: ColorConst.primary,
                              size: 28,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Total Suppliers',

                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: ColorConst.primary.withValues(alpha: 0.4),
                              letterSpacing: 0.2,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            state.dashboardData.totalSuppliers.toString(),

                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: ColorConst.textDark,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 10,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.all(12),
                    width: 180,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: ColorConst.border, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.025),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: ColorConst.primary.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(
                              Icons.medication_outlined,
                              color: ColorConst.primary,
                              size: 28,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Total Medicines',

                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: ColorConst.primary.withValues(alpha: 0.4),
                              letterSpacing: 0.2,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            state.dashboardData.totalMedicines.toString(),

                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: ColorConst.textDark,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: 180,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: ColorConst.border, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.025),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: ColorConst.primary.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(
                              Icons.description_outlined,
                              color: ColorConst.primary,
                              size: 28,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Total Orders',

                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: ColorConst.primary.withValues(alpha: 0.4),
                              letterSpacing: 0.2,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            state.dashboardData.totalOrders.toString(),

                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: ColorConst.textDark,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 10,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.all(12),
                    width: 180,
                    decoration: BoxDecoration(
                      color: Color(0xFFF4B5B8).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: ColorConst.border, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.025),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: Color(0xFFD60000),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(
                              Icons.query_builder_sharp,
                              color: Color(0xFFFFFFFF),
                              size: 28,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Pending Orders',

                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: ColorConst.primary.withValues(alpha: 0.8),
                              letterSpacing: 0.2,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            state.dashboardData.totalPendingOrders.toString(),

                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: ColorConst.textDark,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: 180,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: ColorConst.border, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.025),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: ColorConst.primary.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(
                              Icons.inventory_2_outlined,
                              color: ColorConst.primary,
                              size: 28,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Total Inventory',

                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: ColorConst.primary.withValues(alpha: 0.4),
                              letterSpacing: 0.2,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            state.dashboardData.totalInventory.toString(),

                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: ColorConst.textDark,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          );
        }

        return SizedBox(
          child: Center(
            child: Text(
              "Something wrong",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6B7280),
              ),
            ),
          ),
        );
      },
    );
  }
}
