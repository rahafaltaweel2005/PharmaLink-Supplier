import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/constant/color_const.dart';
import '../../../../../core/utils/image_helper.dart';
import '../../../domain/entity/medicine_type.dart';
import '../cubit/create_medicine_cubit.dart';
import '../state/create_medicine_state.dart';
import '../widget/pharma_text_field.dart';

class CreateMedicineScreen extends StatefulWidget {
  const CreateMedicineScreen({super.key});

  @override
  State<CreateMedicineScreen> createState() => _CreateMedicineScreenState();
}

class _CreateMedicineScreenState extends State<CreateMedicineScreen> {
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create Medicine",
          style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.5),
        ),

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: const Icon(Icons.close_rounded, size: 26),
        ),
      ),
      body: BlocConsumer<CreateMedicineCubit, CreateMedicineState>(
        listener: (context, state) {
          if (state is CreateMedicineErrorState) {
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
          if (state is CreateMedicineSuccessState) {
            Navigator.pop(context, true);
          }
        },
        builder: (context, state) {
          if (state is CreateMedicineLoadingState) {
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
                const SizedBox(height: 20),
                Container(
                  height: 280,
                  width: double.infinity,
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
                  child: selectedImage != null
                      ? Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Image.file(
                          File(ImageMedicineController.text),
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
                            icon: Icon(
                              Icons.close_rounded,
                              color: ColorConst.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                      : Center(
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
                const SizedBox(height: 22),
                PharmaTextField(
                  controller: nameMedicineController,
                  title: 'Name Medicine',
                  hint: "Doloraz 400 mg",
                  prefixIcon: Icons.medication_outlined,
                ),
                const SizedBox(height: 18),
                Text(
                  "Medicine Category",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ColorConst.primary,
                  ),
                ),

                const SizedBox(height: 10),

                DropdownButtonFormField<MedicineType>(
                  initialValue: selectedType,
                  hint: Text("painkiller"),

                  items: MedicineType.values.map((type) {
                    return DropdownMenuItem(
                      value: type,

                      child: Text(
                        type.name,

                        style: const TextStyle(
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
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 22,
                      horizontal: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: ColorConst.border,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
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
                  hint: "1.43",
                  prefixIcon: Icons.attach_money_outlined,
                ),
                const SizedBox(height: 18),
                PharmaTextField(
                  controller: descriptionMedicineController,
                  title: 'Description',
                  hint: 'Medicine description...',
                  maxLines: 5,
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
                      if (selectedType == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select medicine category'),
                          ),
                        );
                        return;
                      } if (ImageMedicineController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select an image'),
                          ),
                        );
                        return;
                      }if (nameMedicineController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter medicine name'),
                          ),
                        );
                        return;
                      }if ( double.tryParse(priceMedicineController.text) == null ||  double.tryParse(priceMedicineController.text)! <= 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter a valid price'),
                          ),
                        );
                        return;
                      }

                      context.read<CreateMedicineCubit>().createMedicine(
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
                        const Icon(Icons.save_outlined, color: Colors.white),
                        const SizedBox(width: 10),
                        const Text(
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
