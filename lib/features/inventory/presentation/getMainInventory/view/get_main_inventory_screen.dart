import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_link_supplier/features/inventory/presentation/getMainInventory/cubit/get_main_inventory_cubit.dart';
import 'package:pharma_link_supplier/features/medicine/presentation/getMedicineById/view/get_medicine_by_id_screen.dart';

import '../../../../auth/presentation/login/widget/pharma_text_field.dart';
import '../../../domain/entity/inventory_entity.dart';
import '../state/get_main_inventory_state.dart';
import '../widget/pharma_card.dart';

class GetMainInventoryScreen extends StatefulWidget {
  const GetMainInventoryScreen({super.key});

  @override
  State<GetMainInventoryScreen> createState() => _GetMainInventoryScreenState();
}

class _GetMainInventoryScreenState extends State<GetMainInventoryScreen> {
  TextEditingController searchController = TextEditingController();
  List<InventoryEntity> allInventory = [];
  List<InventoryEntity> filteredInventory = [];

  @override
  void initState() {
    super.initState();
    context.read<GetMainInventoryCubit>().getMainInventory();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void search(String searchController) {
    setState(() {
      filteredInventory = allInventory.where((inventory) {
        return inventory.medicineName.toLowerCase().contains(searchController.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<GetMainInventoryCubit, GetMainInventoryState>(
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
            if (allInventory.isEmpty) {
              allInventory = state.inventory;
              filteredInventory = state.inventory;
            }
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

            return Column(
              children: [
                PharmaTextField(
                  controller: searchController,
                  hint: "Search by medicine name",
                  prefixIcon: Icons.search_outlined,
                  obscureText: false,
                  onChange: (value) {
                    search(value ?? "");
                  },
                ),

                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),

                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),

                    itemCount: filteredInventory.length,

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
                                    id: filteredInventory[index].medicineId,
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
                                inventory: filteredInventory[index],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
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

      );

  }
}
