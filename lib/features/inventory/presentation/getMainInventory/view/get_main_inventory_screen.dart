import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_link_supplier/features/inventory/presentation/getMainInventory/cubit/get_main_inventory_cubit.dart';
import 'package:pharma_link_supplier/features/medicine/presentation/getMedicineById/view/get_medicine_by_id_screen.dart';

import '../state/get_main_inventory_state.dart';
import '../widget/pharma_card.dart';

class GetMainInventoryScreen extends StatefulWidget {
  const GetMainInventoryScreen({super.key});

  @override
  State<GetMainInventoryScreen> createState() => _GetMainInventoryScreenState();
}

class _GetMainInventoryScreenState extends State<GetMainInventoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetMainInventoryCubit>().getMainInventory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Inventory",
          style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.5),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded, size: 26),
          ),
        ],
      ),

      body: BlocConsumer<GetMainInventoryCubit, GetMainInventoryState>(
        listener: (context, state) {},

        builder: (context, state) {
          if (state is GetMainInventoryLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetMainInventoryErrorState) {
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

          if (state is GetMainInventoryLoadedState) {
            final inventory = state.inventory;

            if (inventory.isEmpty) {
              return const Center(
                child: Text(
                  'No inventory found',

                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6B7280),
                  ),
                ),
              );
            }

            return ListView.builder(
              physics: const BouncingScrollPhysics(),

              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 10,
              ),

              itemCount: inventory.length,

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
                      onTap: () async {
                       await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GetMedicineByIdScreen(
                              id: state.inventory[index].medicineId,
                            ),
                          ),
                        );
                        context
                            .read<GetMainInventoryCubit>()
                            .getMainInventory();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: PharmaCard(
                          inventory: state.inventory[index],
                        ),
                      ),
                    ),
                  ),
                );
              },
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
