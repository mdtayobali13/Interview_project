import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';

ThemeData appThemeData = ThemeData(
  useMaterial3: true,
  fontFamily: 'Montaserrat',
  scaffoldBackgroundColor: AppColors.instance.scaffoldBg,
  colorScheme: ColorScheme.light(
    primary: AppColors.instance.primary,
    onPrimary: Colors.white,
    secondary: AppColors.instance.accentIndigo,
    surface: AppColors.instance.cardBg,
    onSurface: AppColors.instance.primaryTextColor,
    error: AppColors.instance.error,
    onError: Colors.white,
  ),
  dividerColor: AppColors.instance.borderLight,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.instance.cardBg,
    foregroundColor: AppColors.instance.primaryTextColor,
    elevation: 0,
    scrolledUnderElevation: 0.5,
    surfaceTintColor: Colors.transparent,
    centerTitle: false,
    titleTextStyle: TextStyle(
      fontFamily: 'Montaserrat',
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColors.instance.primaryTextColor,
      letterSpacing: -0.2,
    ),
  ),
  cardTheme: CardThemeData(
    color: AppColors.instance.cardBg,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(color: AppColors.instance.border, width: 1),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.instance.cardBg,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    hintStyle: TextStyle(
      fontFamily: 'Montaserrat',
      fontSize: 13,
      color: AppColors.instance.hintText,
      fontWeight: FontWeight.w400,
    ),
    labelStyle: TextStyle(
      fontFamily: 'Montaserrat',
      fontSize: 13,
      color: AppColors.instance.subTextColor,
      fontWeight: FontWeight.w500,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: AppColors.instance.border),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: AppColors.instance.border),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: AppColors.instance.primary, width: 1.6),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: AppColors.instance.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: AppColors.instance.error, width: 1.6),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: AppColors.instance.primary,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      textStyle: const TextStyle(
        fontFamily: 'Montaserrat',
        fontSize: 15,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.instance.primary,
      textStyle: const TextStyle(
        fontFamily: 'Montaserrat',
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
);
