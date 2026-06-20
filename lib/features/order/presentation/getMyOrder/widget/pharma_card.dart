import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constant/color_const.dart';
import '../../../domain/entity/order_entity.dart';

class PharmaCard extends StatelessWidget {
  final OrderEntity order;

  const PharmaCard({super.key, required this.order});

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
                    Expanded(
                      child: Text(
                        '#${order.orderId.toString()}',
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: ColorConst.primary,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    if (order.status.name.contains('pending'))
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFE6DDD2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.query_builder_sharp,
                              color: Color(0xFF504040),
                              size: 16,
                            ),
                            SizedBox(width: 5),
                            Text(
                              order.status.name,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF504040),
                              ),
                            ),
                          ],
                        ),
                      )
                    else if (order.status.name.contains('accepted'))
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE4EBF4),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.verified_outlined,
                              color: Color(0xFF1C4BCF),
                              size: 16,
                            ),
                            SizedBox(width: 5),
                            Text(
                              order.status.name,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1C4BCF),
                              ),
                            ),
                          ],
                        ),
                      )
                    else if (order.status.name.contains('preparing'))
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFF3CDC8),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.hourglass_top,
                              color: Color(0xFF735854),
                              size: 16,
                            ),
                            SizedBox(width: 5),
                            Text(
                              order.status.name,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF735854),
                              ),
                            ),
                          ],
                        ),
                      )
                    else if (order.status.name.contains('inTransit'))
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFE8D5BD),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.local_shipping_outlined,
                              color: Color(0xFF24190A),
                              size: 16,
                            ),
                            SizedBox(width: 5),
                            Text(
                              order.status.name,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF24190A),
                              ),
                            ),
                          ],
                        ),
                      )
                    else if (order.status.name.contains('delivered'))
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFE5F1E9),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Color(0xFF177B3B),
                              size: 16,
                            ),
                            SizedBox(width: 5),
                            Text(
                              order.status.name,

                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF177B3B),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),

                Row(
                  children: [
                    Text(
                      'Order Date: ',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: ColorConst.neutral,
                      ),
                    ),
                    Text(
                 DateFormat('dd-MM-yyyy').format(order.orderDate),

                      style: const TextStyle(
                        height: 1.5,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorConst.neutral,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                Row(
                  children: [

                    Text(
                     'Doctor Name: ',

                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: ColorConst.neutral,
                      ),
                    ),Text(
                      order.doctorName!,

                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: ColorConst.neutral,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Items: ',

                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: ColorConst.neutral,
                      ),
                    ),
                    Text(
                      '${order.orderItems.length}',

                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: ColorConst.neutral,
                      ),
                    ),
                  ],
                ),
                Text(
                  '\$${order.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
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
