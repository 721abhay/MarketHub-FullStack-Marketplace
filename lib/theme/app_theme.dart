import 'package:amazon_clone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.bgLight,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.cardLight,
    ),
    textTheme: GoogleFonts.outfitTextTheme().copyWith(
      displayLarge: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: AppColors.textMain),
      titleLarge: GoogleFonts.outfit(fontWeight: FontWeight.w600, color: AppColors.textMain),
      bodyMedium: GoogleFonts.outfit(color: AppColors.textMain),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: AppColors.textMain),
    ),
    cardTheme: const CardThemeData(
      elevation: 0,
      color: AppColors.cardLight,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.bgDark,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: AppColors.primary,
      surface: AppColors.cardDark,
    ),
    textTheme: GoogleFonts.outfitTextTheme(ThemeData.dark().textTheme).copyWith(
      displayLarge: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: AppColors.textMainDark),
      titleLarge: GoogleFonts.outfit(fontWeight: FontWeight.w600, color: AppColors.textMainDark),
      bodyMedium: GoogleFonts.outfit(color: AppColors.textMainDark),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.textMainDark),
    ),
    cardTheme: const CardThemeData(
      elevation: 0,
      color: AppColors.cardDark,
    ),
  );
}
