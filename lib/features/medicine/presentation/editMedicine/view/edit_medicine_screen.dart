import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/constant/color_const.dart';
import '../../../../../core/utils/image_helper.dart';
import '../../../../inventory/presentation/addMedicine/view/add_medicine_screen.dart';
import '../../../domain/entity/medicine_entity.dart';
import '../../../domain/entity/medicine_type.dart';
import '../cubit/edit_medicine_cubit.dart';
import '../state/edit_medicine_state.dart';
import '../widget/pharma_text_field.dart';

class EditMedicineScreen extends StatefulWidget {
  final int id;
  final MedicineEntity medicine;

  const EditMedicineScreen({
    super.key,
    required this.id,
    required this.medicine,
  });

  @override
  State<EditMedicineScreen> createState() => _EditMedicineScreenState();
}

class _EditMedicineScreenState extends State<EditMedicineScreen> {
  File? selectedImage;
  final TextEditingController nameMedicineController = TextEditingController();
  final TextEditingController ImageMedicineController = TextEditingController();
  MedicineType? selectedType;
  final TextEditingController priceMedicineController = TextEditingController();
  final TextEditingController descriptionMedicineController =
      TextEditingController();
  final ImageHelper imageHelper = ImageHelper();

  @override
  void dispose() {
    nameMedicineController.dispose();
    ImageMedicineController.dispose();
    priceMedicineController.dispose();
    descriptionMedicineController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    ImageMedicineController.text = widget.medicine.imageUrl.toString();
    nameMedicineController.text = widget.medicine.name;
    selectedType = widget.medicine.type;
    priceMedicineController.text = widget.medicine.price.toString();
    descriptionMedicineController.text = widget.medicine.description ?? "";
  }

  bool isValidNetworkImage(String path) {
    return path.startsWith('http://') || path.startsWith('https://');
  }

  @override
  Widget build(BuildContext context) {
    final imagePath = ImageMedicineController.text;

    final isNetworkImage =
        imagePath.startsWith('http://') || imagePath.startsWith('https://');
    final isLocalImage = imagePath.startsWith('/');
    imagePath.startsWith('/storage') ||
        imagePath.startsWith('/data') ||
        imagePath.startsWith('/var');
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Medicine",
          style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.5),
        ),

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: const Icon(Icons.close_rounded, size: 26),
        ),
      ),

      body: BlocConsumer<EditMedicineCubit, EditMedicineState>(
        listener: (context, state) {
          if (state is EditMedicineErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }

          if (state is EditMedicineSuccessState) {
            Navigator.pop(context, true);
          }
        },

        builder: (context, state) {
          if (state is EditMedicineLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Medicine Image",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.primary,
                  ),
                ),
                SizedBox(height: 20),
                isLocalImage
                    ? Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(32),
                            child: Image.file(
                              File(imagePath),
                              height: 280,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 14,
                            right: 14,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    ImageMedicineController.clear();
                                    selectedImage = null;
                                  });
                                },
                                icon: const Icon(
                                  Icons.close_rounded,
                                  color: ColorConst.primary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : isNetworkImage
                    ? Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(32),
                            child: Image.network(
                              imagePath,
                              headers: const {
                                'ngrok-skip-browser-warning': 'true',
                              },
                              height: 280,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 14,
                            right: 14,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    ImageMedicineController.clear();
                                  });
                                },
                                icon: const Icon(
                                  Icons.close_rounded,
                                  color: ColorConst.primary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(
                        height: 280,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: theme.colorScheme.surface,
                          border: Border.all(
                            color: ColorConst.border,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 24,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () async {
                              File? image = await imageHelper.pickImage(
                                ImageSource.gallery,
                              );
                              if (image != null) {
                                setState(() {
                                  selectedImage = image;
                                  ImageMedicineController.text = image.path;
                                });
                              }
                            },
                            icon: Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 46,
                              color: ColorConst.primary,
                            ),
                          ),
                        ),
                      ),

                SizedBox(height: 22),
                PharmaTextField(
                  controller: nameMedicineController,
                  title: 'Name Medicine',
                  prefixIcon: Icons.medication_outlined,
                ),
                SizedBox(height: 18),
                Text(
                  "Medicine Category",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ColorConst.primary,
                  ),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<MedicineType>(
                  initialValue: selectedType,
                  items: MedicineType.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(
                        type.name,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: ColorConst.textDark,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedType = value;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: theme.colorScheme.surface,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 22,
                      horizontal: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: ColorConst.border,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: ColorConst.primary,
                        width: 1.4,
                      ),
                    ),
                  ),
                  dropdownColor: theme.colorScheme.surface,
                ),
                SizedBox(height: 18),
                PharmaTextField(
                  controller: priceMedicineController,
                  title: 'Price',
                  prefixIcon: Icons.attach_money_outlined,
                ),
                SizedBox(height: 18),
                PharmaTextField(
                  controller: descriptionMedicineController,
                  title: 'Description',
                  hint: 'Medicine description...',
                  maxLines: 5,
                ),
                SizedBox(height: 30),
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
                      if (selectedType == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select medicine category'),
                          ),
                        );
                        return;
                      }
                      context.read<EditMedicineCubit>().editMedicine(
                        id: widget.id,
                        name: nameMedicineController.text,
                        imageUrl: ImageMedicineController.text,
                        price:
                            double.tryParse(priceMedicineController.text) ?? 0,
                        type: selectedType!,
                        description: descriptionMedicineController.text,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.save_outlined, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          "Save Medicine",
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
          );
        },
      ),
    );
  }
}
