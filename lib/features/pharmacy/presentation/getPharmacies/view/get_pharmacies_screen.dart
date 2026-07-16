import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_link_supplier/features/pharmacy/domain/entity/pharmacy_entity.dart';

import '../../../../auth/presentation/login/widget/pharma_text_field.dart';
import '../../../../pharmacy/presentation/getPharmacies/widget/pharma_card.dart';
import '../../getPharmacyById/view/get_pharmacy_by_id_screen.dart';
import '../cubit/get_pharmacies_cubit.dart';
import '../state/get_pharmacies_state.dart';

class GetPharmaciesScreen extends StatefulWidget {
  const GetPharmaciesScreen({super.key});

  @override
  State<GetPharmaciesScreen> createState() => _GetPharmaciesScreenState();
}

class _GetPharmaciesScreenState extends State<GetPharmaciesScreen> {
  TextEditingController searchController = TextEditingController();
  List<PharmacyEntity> allPharmacies = [];
  List<PharmacyEntity> filteredPharmacies = [];

  @override
  void initState() {
    super.initState();
    context.read<GetPharmaciesCubit>().getPharmacies();
  }

  void search(String searchController) {
    setState(() {
      filteredPharmacies = allPharmacies.where((pharmacy) {
        return pharmacy.userName.toString().contains(
          searchController.toLowerCase(),
        );
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetPharmaciesCubit, GetPharmaciesState>(
        builder: (context, state) {
          if (state is GetPharmaciesLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetPharmaciesErrorState) {
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

          if (state is GetPharmaciesLoadedState) {
            allPharmacies = List.from(state.pharmacy);

            if (searchController.text.isEmpty) {
              filteredPharmacies = List.from(state.pharmacy);
            } else {
              filteredPharmacies = filteredPharmacies = allPharmacies.where((
                pharmacy,
              ) {
                return pharmacy.userName.toLowerCase().contains(
                  searchController.text.toLowerCase(),
                );
              }).toList();
            }

            final pharmacy = state.pharmacy;

            if (pharmacy.isEmpty) {
              return const Center(
                child: Text(
                  'No pharmacy found',

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
                  hint: "pharmacy Name",
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

                        itemCount: filteredPharmacies.length,

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
                                  final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => GetPharmacyByIdScreen(
                                        id: filteredPharmacies[index].id,
                                      ),
                                    ),
                                  );
                                  if (result == true) {
                                    context
                                        .read<GetPharmaciesCubit>()
                                        .getPharmacies();
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: PharmaCard(
                                    pharmacy: filteredPharmacies[index],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
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
      ),
    );
  }
}
