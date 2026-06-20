import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constant/color_const.dart';
import '../../../domain/entity/inventory_entity.dart';

class PharmaCard extends StatelessWidget {
  final InventoryEntity inventory;

  const PharmaCard({super.key, required this.inventory});

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: ColorConst.primary.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.medication_outlined,
                        color: ColorConst.primary,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        inventory.medicineName,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: ColorConst.primary,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    if (inventory.quantity <= 20)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFF4D0CD),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "Low Stock",
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFB50000),
                          ),
                        ),
                      )
                    else if (inventory.expiryDate
                            .difference(DateTime.now())
                            .inDays <=
                        30)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFE8D5BD),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "Expiring",
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF24190A),
                          ),
                        ),
                      )
                    else
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFE5F1E9),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "In Stock",
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF177B3B),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: ColorConst.primary,
                      size: 24,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Expiry Date: ',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: ColorConst.neutral,
                      ),
                    ),
                    Text(
                      DateFormat('dd-MM-yyyy').format(inventory.expiryDate),

                      style: const TextStyle(
                        height: 1.5,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorConst.neutral,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Icon(
                      Icons.inventory_2_outlined,
                      color: ColorConst.primary,
                      size: 24,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Quantity: ',

                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: ColorConst.neutral,
                      ),
                    ),
                    Text(
                      inventory.quantity.toString(),

                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: ColorConst.neutral,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
