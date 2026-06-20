import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../core/constant/color_const.dart';
import '../cubit/add_medicine_cubit.dart';
import '../state/add_medicine_state.dart';
import '../widget/pharma_text_field.dart';

class AddMedicineScreen extends StatefulWidget {
  final int id;

  const AddMedicineScreen({super.key, required this.id});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final TextEditingController quantityMedicineController =
  TextEditingController();
  final TextEditingController expiryDateMedicineController =
  TextEditingController();

  @override
  void dispose() {
    quantityMedicineController.dispose();
    expiryDateMedicineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Medicine To Inventory",
          style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.5),
        ),

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: const Icon(Icons.close_rounded, size: 26),
        ),
      ),
      body: BlocConsumer<AddMedicineCubit, AddMedicineState>(
        listener: (context, state) {
          if (state is AddMedicineErrorState) {
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
          if (state is AddMedicineSuccessState) {
            Navigator.pop(context, true);
          }
        },
        builder: (context, state) {
          if (state is AddMedicineLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: theme.colorScheme.surface,
                    border: Border.all(color: ColorConst.border, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 24,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PharmaTextField(
                        controller: quantityMedicineController,
                        title: 'Stock',
                        hint: "100",
                        prefixIcon: Icons.inventory_2_outlined,
                      ),
                      SizedBox(height: 18),

                      PharmaTextField(
                        controller: expiryDateMedicineController,
                        title: 'Select expiry Date',
                        hint: "${DateTime.now()}",
                        prefixIcon: Icons.calendar_month,
                        readOnly: true,
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2035),
                          );

                          if (date != null) {
                            expiryDateMedicineController.text = DateFormat(
                              'yyyy-MM-dd',
                            ).format(date);
                          }
                        },


                      ),
                      const SizedBox(height: 30),
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
                            if (quantityMedicineController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please add quantity'),
                                ),
                              );
                              return;
                            }
                            if (expiryDateMedicineController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please add expiryDate'),
                                ),
                              );
                              return;
                            }
                            print(widget.id);
                            print(quantityMedicineController.text);
                            print(expiryDateMedicineController.text);
                            context.read<AddMedicineCubit>().addMedicine(
                              medicineId: widget.id,
                              quantity: int.parse(quantityMedicineController.text),
                              expiryDate: DateTime.parse(
                                expiryDateMedicineController.text,
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.add, color: Colors.white),
                              const SizedBox(width: 10),
                              const Text(
                                "add Medicine",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                ),



            ],
                        ),
          );
        },
      ),
    );
  }
}
