import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pharma_link_supplier/features/order/presentation/updateStatus/cubit/update_status_cubit.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../../core/constant/color_const.dart';
import '../../updateStatus/state/update_status_state.dart';
import '../cubit/get_order_by_id_cubit.dart';
import '../state/get_order_by_id_state.dart';

class GetOrderByIdScreen extends StatefulWidget {
  final int id;

  const GetOrderByIdScreen({super.key, required this.id});

  @override
  State<GetOrderByIdScreen> createState() => _GetOrderByIdScreenState();
}

class _GetOrderByIdScreenState extends State<GetOrderByIdScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetOrderByIdCubit>().getOrderById(widget.id);
  }

  int getCurrentStatusIndex(String status) {
    if (status.contains('pending')) return 0;
    if (status.contains('accepted')) return 1;
    if (status.contains('preparing')) return 2;
    if (status.contains('inTransit')) return 3;
    if (status.contains('delivered')) return 4;
    return 0;
  }

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    return BlocListener<UpdateStatusCubit, UpdateStatusState>(

      listener: (context, state) {
        if (state is UpdateStatusSuccessState) {
          context.read<GetOrderByIdCubit>().getOrderById(widget.id);
        }
        if (state is UpdateStatusErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.error,
                textAlign: TextAlign.center,

                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
        }
      },

      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Details Order ${widget.id}",
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: ColorConst.primary,
              letterSpacing: 1,
            ),
          ),
        ),
        body: BlocBuilder<GetOrderByIdCubit, GetOrderByIdState>(
          builder: (context, state) {
            if (state is GetOrderByIdLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is GetOrderByIdErrorState) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    state.error,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              );
            }
            if (state is GetOrderByIdLoadedState) {
              final int currentIndex = getCurrentStatusIndex(
                state.order.status.name,
              );

              return SingleChildScrollView(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),

                      decoration: BoxDecoration(
                        color: ColorConst.border,

                        borderRadius: BorderRadius.circular(12),

                        border: Border.all(color: ColorConst.border, width: 1),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 24,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .surface,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.insert_chart_outlined),
                                SizedBox(width: 10),
                                Text(
                                  "Order Tracking",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: ColorConst.textDark,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Column(
                              children: [
                                TimelineTile(
                                  isFirst: true,
                                  indicatorStyle: IndicatorStyle(
                                    width: 20,
                                    color: currentIndex >= 0
                                        ? ColorConst.primary
                                        : ColorConst.border,
                                    iconStyle: IconStyle(
                                      iconData: Icons.check,
                                      fontSize: 12,
                                      color: currentIndex >= 0
                                          ? Colors.white
                                          : ColorConst.border,
                                    ),
                                  ),
                                  endChild: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      "Pending",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: ColorConst.textDark,
                                      ),
                                    ),
                                  ),
                                ),
                                TimelineTile(
                                  indicatorStyle: IndicatorStyle(
                                    width: 20,
                                    color: currentIndex >= 1
                                        ? ColorConst.primary
                                        : ColorConst.border,
                                    iconStyle: IconStyle(
                                      iconData: Icons.check,
                                      fontSize: 12,
                                      color: currentIndex >= 1
                                          ? Colors.white
                                          : ColorConst.border,
                                    ),
                                  ),
                                  endChild: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      "Accepted",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: ColorConst.textDark,
                                      ),
                                    ),
                                  ),
                                ),
                                TimelineTile(
                                  indicatorStyle: IndicatorStyle(
                                    width: 20,
                                    color: currentIndex >= 2
                                        ? ColorConst.primary
                                        : ColorConst.border,
                                    iconStyle: IconStyle(
                                      iconData: Icons.check,
                                      fontSize: 12,
                                      color: currentIndex >= 2
                                          ? Colors.white
                                          : ColorConst.border,
                                    ),
                                  ),
                                  endChild: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      "Preparing",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: ColorConst.textDark,
                                      ),
                                    ),
                                  ),
                                ),
                                TimelineTile(
                                  indicatorStyle: IndicatorStyle(
                                    width: 20,
                                    color: currentIndex >= 3
                                        ? ColorConst.primary
                                        : ColorConst.border,
                                    iconStyle: IconStyle(
                                      iconData: Icons.check,
                                      fontSize: 12,
                                      color: currentIndex >= 3
                                          ? Colors.white
                                          : ColorConst.border,
                                    ),
                                  ),
                                  endChild: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      "In Transit",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: ColorConst.textDark,
                                      ),
                                    ),
                                  ),
                                ),

                                TimelineTile(
                                  isLast: true,
                                  indicatorStyle: IndicatorStyle(
                                    width: 20,
                                    color: currentIndex >= 4
                                        ? ColorConst.primary
                                        : ColorConst.border,
                                    iconStyle: IconStyle(
                                      iconData: Icons.check,
                                      fontSize: 12,
                                      color: currentIndex >= 4
                                          ? Colors.white
                                          : ColorConst.border,
                                    ),
                                  ),
                                  endChild: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      "Delivered",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: ColorConst.textDark,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(12),

                      decoration: BoxDecoration(
                        color: ColorConst.border,

                        borderRadius: BorderRadius.circular(12),

                        border: Border.all(color: ColorConst.border, width: 1),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 24,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .surface,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.local_shipping_outlined,
                                  color: Color(0xFF24190A),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Order Date",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: ColorConst.textDark,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(
                                  Icons.query_builder_sharp,
                                  color: Color(0xFF24190A),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  DateFormat(
                                    'dd-MM-yyyy',
                                  ).format(state.order.orderDate),

                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: ColorConst.textDark,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.query_builder_sharp,
                                  color: Color(0xFF24190A),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  state.order.deliveryTime != null
                                      ? DateFormat(
                                    'dd-MM-yyyy',
                                  ).format(state.order.deliveryTime!)
                                      : "Not delivered yet",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: ColorConst.textDark,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  color: Color(0xFF24190A),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  state.order.pharmacyName ?? "",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: ColorConst.textDark,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(12),

                      decoration: BoxDecoration(
                        color: ColorConst.border,

                        borderRadius: BorderRadius.circular(12),

                        border: Border.all(color: ColorConst.border, width: 1),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 24,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .surface,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Color(0xFF24190A),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Order Contents",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: ColorConst.textDark,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: theme.colorScheme.surface,
                                border: Border.all(
                                  color: ColorConst.border,
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    spacing: 15,
                                    children: [
                                      Expanded(
                                        flex: 2,

                                        child: Text("Product Name"),
                                      ),
                                      Expanded(child: Text("Quantity")),
                                      Expanded(child: Text("Price")),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      state.order.orderItems.isEmpty
                                          ? Text("No items in cart")
                                          : ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                        NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                        ),
                                        itemCount:
                                        state.order.orderItems.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.only(
                                              bottom: 10,
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    state
                                                        .order
                                                        .orderItems[index]
                                                        .medicineName,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    " ${state.order
                                                        .orderItems[index]
                                                        .quantity}",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      color: ColorConst
                                                          .textDark,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    " \$${state.order
                                                        .orderItems[index]
                                                        .unitPrice}",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      color: ColorConst
                                                          .textDark,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    if (currentIndex < 4)
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConst.primary,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            context.read<UpdateStatusCubit>().updateStatus(
                              orderId: widget.id,
                              status: currentIndex + 1,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (currentIndex == 0)
                                Row(
                                  children: [
                                    Icon(Icons.verified_outlined,
                                        color: Colors.white),
                                    SizedBox(width: 10),
                                    Text(
                                      "Accept",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),

                              if (currentIndex == 1)
                                Row(
                                  children: [
                                    Icon(Icons.hourglass_top, color: Colors.white),
                                    SizedBox(width: 10),
                                    Text(
                                      "Preparing",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),

                              if (currentIndex == 2)
                                Row(
                                  children: [
                                    Icon(Icons.local_shipping_outlined,
                                        color: Colors.white),
                                    SizedBox(width: 10),
                                    Text(
                                      "In Transit",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),

                              if (currentIndex == 3)
                                Row(
                                  children: [
                                    Icon(Icons.check_circle, color: Colors.white),
                                    SizedBox(width: 10),
                                    Text(
                                      "Delivered",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),

                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }
            return SizedBox(child: Text("Something wrong"));
          },
        ),
      ),
    );
  }
}
