import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant/color_const.dart';
import '../../../../auth/presentation/login/widget/pharma_text_field.dart';
import '../../../domain/entity/medicine_entity.dart';
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
  TextEditingController searchController = TextEditingController();
  List<MedicineEntity> allMedicine = [];
  List<MedicineEntity> filteredMedicine = [];
  @override
  void initState() {
    super.initState();
    context.read<GetMedicineCubit>().getMedicines();
  }
  void search(String searchController) {
    setState(() {
      filteredMedicine = allMedicine.where((medicine) {
        return medicine.name.toLowerCase().contains(searchController.toLowerCase());
      }).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMedicineCubit, GetMedicineState>(
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
          if (allMedicine.isEmpty) {
            allMedicine = state.medicines;
            filteredMedicine = state.medicines;
          }
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

          return Column(
            children: [
              PharmaTextField(
                controller: searchController,
                hint: "Medicine Name",
                prefixIcon: Icons.search_outlined,
                obscureText: false,
                onChange: (value) {
                  search(value ?? "");
                },
              ),

              Expanded(
                child: Stack(
                  children: [
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),

                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),

                      itemCount: filteredMedicine.length,

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
                                      id: filteredMedicine[index].id,
                                    ),
                                  ),
                                );
                                context.read<GetMedicineCubit>().getMedicines();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: PharmaCard(
                                  medicine: filteredMedicine[index],
                                ),
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
