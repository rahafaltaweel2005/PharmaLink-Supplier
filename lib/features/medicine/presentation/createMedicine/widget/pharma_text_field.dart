import 'package:flutter/material.dart';

import '../../../../../core/constant/color_const.dart';

class PharmaTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String? hint;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;

  const PharmaTextField({
    super.key,
    required this.controller,
    required this.title,
     this.hint,
     this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Text(
          title,

          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: ColorConst.primary,
            letterSpacing: 0.2,
          ),
        ),

        const SizedBox(height: 10),

        TextField(
          controller: controller,
          maxLines: maxLines,

          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: ColorConst.textDark,
          ),

          decoration: InputDecoration(
            hintText: hint,

            hintStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: ColorConst.neutral.withValues(alpha: 0.6),
            ),

            prefixIcon: Icon(
              prefixIcon,
              color: ColorConst.primary,
              size: 24,
            ),

            suffixIcon: suffixIcon,

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

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),

              borderSide: const BorderSide(
                color: ColorConst.error,
                width: 1.2,
              ),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),

              borderSide: const BorderSide(
                color: ColorConst.error,
                width: 1.4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
