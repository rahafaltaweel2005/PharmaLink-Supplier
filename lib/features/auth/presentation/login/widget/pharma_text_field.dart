import 'package:flutter/material.dart';

import '../../../../../core/constant/color_const.dart';

class PharmaTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? title;
  final String hint;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final Function(String?)? onChange;

  const PharmaTextField({
    super.key,
    required this.controller,
    this.title,
    required this.hint,
    required this.prefixIcon,
    this.suffixIcon,
    required this.obscureText,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) => title != null
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? "",

              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: ColorConst.primary,
                letterSpacing: 0.3,
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: controller,
              obscureText: obscureText,
              onChanged: onChange,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: ColorConst.textDark,
              ),

              decoration: InputDecoration(
                hintText: hint,

                hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: ColorConst.neutral.withValues(alpha: 0.55),
                ),

                prefixIcon: Icon(
                  prefixIcon,
                  color: ColorConst.primary,
                  size: 24,
                ),

                suffixIcon: suffixIcon,

                filled: true,
                fillColor: Colors.white,

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),

                  borderSide: const BorderSide(
                    color: ColorConst.border,
                    width: 1,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),

                  borderSide: const BorderSide(
                    color: ColorConst.primary,
                    width: 1.5,
                  ),
                ),

                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),

                  borderSide: const BorderSide(
                    color: ColorConst.error,
                    width: 1.2,
                  ),
                ),

                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),

                  borderSide: const BorderSide(
                    color: ColorConst.error,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ],
        )
      : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),

            TextField(
              controller: controller,
              obscureText: obscureText,
              onChanged: onChange,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: ColorConst.textDark,
              ),

              decoration: InputDecoration(
                hintText: hint,

                hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: ColorConst.neutral.withValues(alpha: 0.55),
                ),

                prefixIcon: Icon(
                  prefixIcon,
                  color: ColorConst.primary,
                  size: 24,
                ),

                suffixIcon: suffixIcon,

                filled: true,
                fillColor: Colors.white,

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),

                  borderSide: const BorderSide(
                    color: ColorConst.border,
                    width: 1,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),

                  borderSide: const BorderSide(
                    color: ColorConst.primary,
                    width: 1.5,
                  ),
                ),

                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),

                  borderSide: const BorderSide(
                    color: ColorConst.error,
                    width: 1.2,
                  ),
                ),

                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),

                  borderSide: const BorderSide(
                    color: ColorConst.error,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ],
        );
}
