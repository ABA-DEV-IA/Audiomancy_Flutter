import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

import 'package:flutter/material.dart';

class AppTheme {
  // === Thème clair ===
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.encreAstrale, // Violet profond
    scaffoldBackgroundColor: AppColors.luneVoilee, // Fond clair doux
    cardColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.encreAstrale,
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.encreAstrale,
      secondary: AppColors.amethyseMagique,
      surface: Colors.white,
      error: AppColors.feuAnciens,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.brumeCosmique,
      onError: Colors.white,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.brumeCosmique),
      bodyMedium: TextStyle(color: AppColors.brumeCosmique),
      headlineLarge: TextStyle(color: AppColors.encreAstrale),
      headlineMedium: TextStyle(color: AppColors.amethyseMagique),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.vertDragon,
      foregroundColor: Colors.white,
    ),
  );

  // === Thème sombre ===
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.encreAstrale,
    scaffoldBackgroundColor: AppColors.ombreOcculte, // Fond sombre
    cardColor: AppColors.brumeCosmique,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.brumeCosmique,
      foregroundColor: AppColors.luneVoilee,
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.encreAstrale,
      secondary: AppColors.amethyseMagique,
      surface: AppColors.brumeCosmique,
      error: AppColors.feuAnciens,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.luneVoilee,
      onError: Colors.white,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.luneVoilee),
      bodyMedium: TextStyle(color: AppColors.luneVoilee),
      headlineLarge: TextStyle(color: AppColors.eclatEther),
      headlineMedium: TextStyle(color: AppColors.amethyseMagique),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.vertDragon,
      foregroundColor: AppColors.brumeCosmique,
    ),
  );
}
