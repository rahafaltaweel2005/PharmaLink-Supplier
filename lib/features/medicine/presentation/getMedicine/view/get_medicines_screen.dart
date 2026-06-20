import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_link_supplier/features/order/presentation/updateStatus/cubit/update_status_cubit.dart';
import 'package:pharma_link_supplier/features/order/presentation/updateStatus/state/update_status_state.dart';

import '../../createMedicine/view/create_medicine_screen.dart';
import '../../getMedicineById/view/get_medicine_by_id_screen.dart';
import '../cubit/get_medicine_cubit.dart';
import '../state/get_medicine_state.dart';
import '../widget/pharma_card.dart';

class GetMedicinesScreen extends StatefulWidget {
  const GetMedicinesScreen({super.key});

  @override
  State<GetMedicinesScreen> createState() => _GetMedicinesScreenState();
}

class _GetMedicinesScreenState extends State<GetMedicinesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetMedicineCubit>().getMedicines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Medicines",
            style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.5),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_rounded, size: 26),
            ),
          ],
        ),

        body: BlocConsumer<GetMedicineCubit, GetMedicineState>(
          listener: (context, state) {},

          builder: (context, state) {
            if (state is GetMedicineLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is GetMedicineErrorState) {
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

            if (state is GetMedicineLoadedState) {
              final medicine = state.medicines;

              if (medicine.isEmpty) {
                return const Center(
                  child: Text(
                    'No medicine found',

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

                    itemCount: medicine.length,

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
                                  builder: (context) => GetMedicineByIdScreen(
                                    id: state.medicines[index].id,
                                  ),
                                ),
                              );
                              context.read<GetMedicineCubit>().getMedicines();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: PharmaCard(medicine: state.medicines[index]),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: FloatingActionButton(
                      shape: CircleBorder(),
                      backgroundColor: Color(0xFF5A0B15),
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateMedicineScreen(),
                          ),
                        );
                        if (result == true) {
                          context.read<GetMedicineCubit>().getMedicines();
                        }
                      },
                      child: Icon(Icons.add),
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
        ),
    );
  }
}
