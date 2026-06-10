import 'package:flutter/material.dart';

import '../../../../../core/constant/color_const.dart';

class PharmaButton extends StatelessWidget {
  final String text;
  final IconData? buttonIcon;
  final VoidCallback? onPressed;

  const PharmaButton({
    super.key,
    required this.text,
    this.buttonIcon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConst.primary,
          foregroundColor: Colors.white,

          elevation: 10,

          shadowColor: ColorConst.primary.withValues(alpha: 0.35),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),

          padding: const EdgeInsets.symmetric(vertical: 18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
            const SizedBox(width: 10),

            Icon(buttonIcon, size: 20),
          ],
        ),
      ),
    );
  }
}
