import 'package:flutter/material.dart';
import 'package:pharma_link_supplier/features/pharmacy/domain/entity/pharmacy_entity.dart';

import '../../../../../core/constant/color_const.dart';

class PharmaCard extends StatelessWidget {
  final PharmacyEntity pharmacy;

  const PharmaCard({super.key, required this.pharmacy});

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
                        pharmacy.userName,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: ColorConst.primary,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    if (pharmacy.status.name.contains('pending'))
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
                              pharmacy.status.name,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF504040),
                              ),
                            ),
                          ],
                        ),
                      )
                    else if (pharmacy.status.name.contains('approved'))
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xA8E0F8E1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.verified_outlined,
                              color: Color(0xFF0F7E14),
                              size: 16,
                            ),
                            SizedBox(width: 5),
                            Text(
                              pharmacy.status.name,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF0F7E14),
                              ),
                            ),
                          ],
                        ),
                      )
                    else if (pharmacy.status.name.contains('rejected'))
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
                              Icons.dangerous_outlined,
                              color: Color(0xFF735854),
                              size: 16,
                            ),
                            SizedBox(width: 5),
                            Text(
                              pharmacy.status.name,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF735854),
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
                      'Doctor Name: ',

                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: ColorConst.neutral,
                      ),
                    ),
                    Text(
                      pharmacy.name,

                      style: const TextStyle(
                        height: 1.5,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorConst.neutral,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'License Number: ',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: ColorConst.neutral,
                      ),
                    ),
                    Text(
                      pharmacy.licenseNumber,

                      style: const TextStyle(
                        height: 1.5,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorConst.neutral,
                      ),
                    ),
                  ],
                ), Row(
                  children: [
                    Text(
                      'Location: ',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: ColorConst.neutral,
                      ),
                    ),
                    Text(
                      pharmacy.address,
                      style: const TextStyle(
                        height: 1.5,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorConst.neutral,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // if (pharmacy.status == PharmacyStatus.pending)
                //   Row(
                //     spacing: 10,
                //     children: [
                //       SizedBox(
                //         width: 140,
                //         child: ElevatedButton(
                //           style: ElevatedButton.styleFrom(
                //             backgroundColor: ColorConst.primary,
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(30),
                //             ),
                //           ),
                //           onPressed: () {
                //             context
                //                 .read<UpdateStatusPharmacyCubit>()
                //                 .updateStatusPharmacy(
                //                   pharmacyId: pharmacy.id,
                //                   status: PharmacyStatus.approved.index,
                //                 );
                //           },
                //           child: Text(
                //             "Approved",
                //             style: TextStyle(
                //               fontSize: 18,
                //               fontWeight: FontWeight.w700,
                //               color: Colors.white,
                //             ),
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 140,
                //
                //         child: ElevatedButton(
                //           style: ElevatedButton.styleFrom(
                //             backgroundColor: Colors.white,
                //             shape: RoundedRectangleBorder(
                //               side: BorderSide(color: Colors.red),
                //               borderRadius: BorderRadius.circular(30),
                //             ),
                //           ),
                //           onPressed: () {
                //             context
                //                 .read<UpdateStatusPharmacyCubit>()
                //                 .updateStatusPharmacy(
                //                   pharmacyId: pharmacy.id,
                //                   status: PharmacyStatus.rejected.index,
                //                 );
                //           },
                //           child: Text(
                //             "Rejected",
                //             style: TextStyle(
                //               fontSize: 18,
                //               fontWeight: FontWeight.w700,
                //               color: Colors.red,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
