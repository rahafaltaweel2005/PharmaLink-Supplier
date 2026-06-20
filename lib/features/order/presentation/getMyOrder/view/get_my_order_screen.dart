import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../getOrderById/view/get_order_by_id_screen.dart';
import '../cubit/get_my_order_cubit.dart';
import '../state/get_my_order_state.dart';
import '../widget/pharma_card.dart';


class GetMyOrderScreen extends StatefulWidget {
  const GetMyOrderScreen({super.key});

  @override
  State<GetMyOrderScreen> createState() => _GetMyOrderScreenState();
}

class _GetMyOrderScreenState extends State<GetMyOrderScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetMyOrderCubit>().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Orders",
          style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.5),
        ),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: const Icon(Icons.search_rounded, size: 26),
          ),
        ],
      ),

      body: BlocConsumer<GetMyOrderCubit, GetMyOrderState>(
        listener: (context, state) {},

        builder: (context, state) {
          if (state is GetMyOrderLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetMyOrderErrorState) {
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

          if (state is GetMyOrderLoadedState) {
            final orders = state.orders;

            if (orders.isEmpty) {
              return const Center(
                child: Text(
                  'No orders found',

                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6B7280),
                  ),
                ),
              );
            }

            return Stack(
              children: [
                ListView.builder(
                  physics: const BouncingScrollPhysics(),

                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),

                  itemCount: orders.length,

                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 14),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),

                      child: Material(
                        color: Theme.of(context).colorScheme.surface,

                        borderRadius: BorderRadius.circular(30),

                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GetOrderByIdScreen(
                                  id: state.orders[index].orderId,
                                ),
                              ),
                            );
                            context.read<GetMyOrderCubit>().getOrders();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: PharmaCard(order: state.orders[index]),
                          ),

                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
          return const SizedBox(
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
      ),
    );
  }
}
