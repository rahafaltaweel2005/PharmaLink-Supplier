import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../core/constant/color_const.dart';
import '../../../domain/entity/medicine_entity.dart';

class PharmaCard extends StatelessWidget {
  final MedicineEntity medicine;

  const PharmaCard({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    final imagePath = medicine.imageUrl;
    final isNetworkImage =
        imagePath.startsWith('http://') || imagePath.startsWith('https://');
    final isLocalImage = imagePath.startsWith('/');
    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,

        borderRadius: BorderRadius.circular(30),

        border: Border.all(color: ColorConst.border, width: 1),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Row(
        children: [
          isLocalImage
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(24),

                  child: Image.file(
                    File(imagePath),
                    width: 92,
                    height: 92,
                    fit: BoxFit.cover,

                  ),
                )
              : isNetworkImage
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(24),

                  child: Image.network(
                    imagePath,
                    width: 92,
                    height: 92,
                    fit: BoxFit.cover,
                    headers: const {
                      'ngrok-skip-browser-warning': 'true',
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 92,
                        width: 92,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: const Color(0xFFF3F4F6),
                        ),
                        child: const Icon(
                          Icons.broken_image_outlined,
                          color: Color(0xFF9CA3AF),
                          size: 34,
                        ),
                      );
                    },
                  ),
                )
              : Container(
                  height: 92,
                  width: 92,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: const Color(0xFFF3F4F6),
                  ),

                  child: const Icon(
                    Icons.image_outlined,
                    color: Color(0xFF9CA3AF),
                    size: 34,
                  ),
                ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        medicine.name,

                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: ColorConst.textDark,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),

                      decoration: BoxDecoration(
                        color: const Color(0xFFF4E7E5),

                        borderRadius: BorderRadius.circular(30),
                      ),

                      child: Text(
                        medicine.type.name,

                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: ColorConst.primary,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Text(
                  medicine.description ?? "",

                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    height: 1.5,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorConst.neutral,
                  ),
                ),

                const SizedBox(height: 14),

                Text(
                  '\$${medicine.price.toStringAsFixed(2)}',

                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: ColorConst.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
