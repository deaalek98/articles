import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:articles/src/core/core.dart';

/// Light theme

final ThemeData lightAppTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primaryColorLight,
    onPrimaryContainer: AppColors.primaryColorLight,
    onPrimary: AppColors.white,
    primaryContainer: AppColors.white,
    secondary: AppColors.secondaryColorLight,
    onSecondary: AppColors.white,
    onSecondaryContainer: AppColors.deepRed,
    onTertiaryContainer: AppColors.deepRed,
    onTertiary: AppColors.white,
    error: AppColors.redColor,
    onError: AppColors.white,
    onErrorContainer: AppColors.redColor,
    background: AppColors.white,
    onBackground: AppColors.black,
    surface: AppColors.white,
    onSurface: AppColors.black,
    shadow: AppColors.black,
    onSurfaceVariant: AppColors.surfaceTintLight,
    inverseSurface: AppColors.darkGray,
    surfaceTint: AppColors.surfaceTintLight,
    outlineVariant: AppColors.lightGrey,
    scrim: AppColors.black,
  ),
  useMaterial3: true,
);

/// Dark theme
final ThemeData darkAppTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryColorDark,
    onPrimaryContainer: AppColors.primaryColorDark,
    onPrimary: AppColors.deepRed,
    primaryContainer: AppColors.lightColor,
    secondary: AppColors.secondaryColorDark,
    onSecondary: AppColors.deepRed,
    onSecondaryContainer: AppColors.deepRed,
    onTertiaryContainer: AppColors.deepRed,
    onTertiary: AppColors.deepRed,
    error: AppColors.redColor,
    onError: AppColors.deepRed,
    onErrorContainer: AppColors.redColor,
    background: AppColors.deepRed,
    onBackground: AppColors.black,
    surface: AppColors.deepRed,
    onSurface: AppColors.black,
    shadow: AppColors.black,
    onSurfaceVariant: AppColors.surfaceTintLight,
    inverseSurface: AppColors.darkGray,
    surfaceTint: AppColors.surfaceTintLight,
    outlineVariant: AppColors.lightGrey,
    scrim: AppColors.black,
  ),
  useMaterial3: true,
);
