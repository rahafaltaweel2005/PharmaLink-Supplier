import 'package:flutter/material.dart';
import '../../constant/color_const.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: ColorConst.bgLight,

    fontFamily: 'HankenGrotesk',

    colorScheme: const ColorScheme.light(
      primary: ColorConst.primary,
      secondary: ColorConst.secondary,
      tertiary: ColorConst.tertiary,
      surface: ColorConst.surfaceLight,
      error: ColorConst.error,
      onPrimary: Colors.white,
      onSurface: ColorConst.textDark,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConst.bgLight,
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 2,
      iconTheme: IconThemeData(
        color: ColorConst.primary,
      ),

      titleTextStyle: TextStyle(
        fontFamily: 'Newsreader',
        color: ColorConst.primary,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
    ),

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,

      hintStyle: TextStyle(
        color: ColorConst.neutral.withValues(alpha: 0.55),
        fontSize: 15,
      ),

      labelStyle: const TextStyle(
        color: ColorConst.textDark,
        fontWeight: FontWeight.w500,
      ),

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 18,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
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

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConst.primary,
        foregroundColor: Colors.white,

        minimumSize: const Size(
          double.infinity,
          56,
        ),

        elevation: 0,

        textStyle: const TextStyle(
          fontFamily: 'HankenGrotesk',
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Newsreader',
        fontSize: 34,
        fontWeight: FontWeight.bold,
        color: ColorConst.primary,
      ),

      headlineMedium: TextStyle(
        fontFamily: 'Newsreader',
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: ColorConst.primary,
      ),

      bodyLarge: TextStyle(
        fontSize: 16,
        height: 1.6,
        color: ColorConst.textDark,
      ),

      bodyMedium: TextStyle(
        fontSize: 14,
        height: 1.5,
        color: ColorConst.neutral,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: ColorConst.bgDark,

    fontFamily: 'HankenGrotesk',

    colorScheme: const ColorScheme.dark(
      primary: ColorConst.secondary,
      secondary: ColorConst.tertiary,
      tertiary: ColorConst.neutral,
      surface: ColorConst.surfaceDark,
      error: ColorConst.error,
      onPrimary: ColorConst.primary,
      onSurface: Colors.white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConst.bgDark,
      elevation: 0,
      centerTitle: true,

      iconTheme: IconThemeData(
        color: ColorConst.secondary,
      ),

      titleTextStyle: TextStyle(
        fontFamily: 'Newsreader',
        color: Colors.white,
        fontSize: 26,
        fontWeight: FontWeight.w700,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorConst.surfaceDark,

      hintStyle: TextStyle(
        color: Colors.white.withValues(alpha: 0.4),
      ),

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 18,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),

        borderSide: BorderSide(
          color: Colors.white.withValues(alpha: 0.08),
          width: 1,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),

        borderSide: const BorderSide(
          color: ColorConst.secondary,
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
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConst.secondary,
        foregroundColor: ColorConst.primary,

        minimumSize: const Size(
          double.infinity,
          56,
        ),

        elevation: 0,

        textStyle: const TextStyle(
          fontFamily: 'HankenGrotesk',
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );
}