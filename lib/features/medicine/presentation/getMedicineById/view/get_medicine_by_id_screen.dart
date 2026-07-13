import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_link_supplier/core/constant/color_const.dart';

import '../../../../dashboard/presentation/dashboard/cubit/dashboard_cubit.dart';
import '../../../../inventory/presentation/addMedicine/view/add_medicine_screen.dart';
import '../../deleteMedicine/cubit/delete_medicine_cubit.dart';
import '../../deleteMedicine/state/delete_medicine_state.dart';
import '../cubit/get_medicine_by_id_cubit.dart';
import '../state/get_medicine_by_id_state.dart';
import '../../editMedicine/view/edit_medicine_screen.dart';

class GetMedicineByIdScreen extends StatefulWidget {
  final int id;

  const GetMedicineByIdScreen({super.key, required this.id});

  @override
  State<GetMedicineByIdScreen> createState() => _GetMedicineByIdScreenState();
}

class _GetMedicineByIdScreenState extends State<GetMedicineByIdScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetMedicineByIdCubit>().getMedicineById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteMedicineCubit, DeleteMedicineState>(
      listener: (context, state) {
        if (state is DeleteMedicineSuccessState) {
          context.read<DashboardCubit>().dashboard();
          Navigator.pop(context);
          Navigator.pop(context, true);
        }
        if (state is DeleteMedicineErrorState) {
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
      child:  BlocBuilder<GetMedicineByIdCubit, GetMedicineByIdState>(
          builder: (context, state) {
            if (state is GetMedicineByIdLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is GetMedicineByIdErrorState) {
             Center(
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
            if (state is GetMedicineByIdLoadedState) {
              final imagePath = state.medicine.imageUrl;
              final isNetworkImage =
                  imagePath.startsWith('http://') ||
                  imagePath.startsWith('https://');
              final isLocalImage = imagePath.startsWith('/');
              return  Scaffold(
                appBar: AppBar(
                  title: Text(
                    state.medicine.name,
                    style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: ColorConst.primary,
                    letterSpacing: 1,
                  ),
                ),
              ),
            body:SingleChildScrollView(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    isLocalImage
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(28),
                            child: Image.file(
                              File(imagePath),
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          )
                        : isNetworkImage
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(28),
                            child: Image.network(
                              imagePath,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              color: const Color(0xFFF1E8E2),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.image_outlined,
                                size: 60,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF5A0B15),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        '\$${state.medicine.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 26),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1D9D3),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        state.medicine.type.name,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF8A4B42),
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      state.medicine.description ?? "",
                      style: const TextStyle(
                        height: 1.5,
                        fontSize: 17,
                        color: Color(0xFF6B615E),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF5A0B15),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),

                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditMedicineScreen(
                                id: widget.id,
                                medicine: state.medicine,
                              ),
                            ),
                          );
                          if (result == true) {
                            context
                                .read<GetMedicineByIdCubit>()
                                .getMedicineById(widget.id);
                          }
                        },

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.edit_outlined),
                            SizedBox(width: 8),
                            Text(
                              "Edit Medicine",

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
                    SizedBox(height: 4),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:   Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color:Color(0xFF5A0B15),
                            ),
                            borderRadius: BorderRadius.circular(50),

                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AddMedicineScreen(id: widget.id),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add,  color:Color(0xFF5A0B15)),
                            SizedBox(width: 10),
                            Text(
                              "Add Medicine",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color:Color(0xFF5A0B15),

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: Colors.red),
                          backgroundColor: ColorConst.bgLight,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),

                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: Text("Delete Medicine"),
                                content: Text(
                                  "Are you sure want delete this medicine ?",
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      side: BorderSide(color: Colors.red),
                                      backgroundColor: ColorConst.bgLight,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 18,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),

                                  ElevatedButton(
                                    onPressed: () {
                                      context
                                          .read<DeleteMedicineCubit>()
                                          .deleteMedicine(widget.id);
                                    },
                                    child: Text("Delete"),
                                  ),
                                ],
                              );
                            },
                          );
                        },

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete_outline_rounded,
                              color: Colors.red,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Delete Medicine",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
              );
            }
            return SizedBox(child: Text("Something wrong"));
          },
        ),
      );
  }
}
