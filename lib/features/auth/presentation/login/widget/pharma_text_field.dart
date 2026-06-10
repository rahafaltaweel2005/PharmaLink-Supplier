import 'package:flutter/material.dart';

import '../../../../../core/constant/color_const.dart';

class PharmaTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hint;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;

  const PharmaTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.hint,
    required this.prefixIcon,
    this.suffixIcon,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          title,

          style: theme.textTheme.bodyLarge?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.primary,
          ),
        ),

        const SizedBox(height: 10),

        TextField(
          controller: controller,
          obscureText: obscureText,

          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.onSurface,
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
              color: theme.colorScheme.primary,
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