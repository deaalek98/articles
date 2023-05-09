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
    onSurfaceVariant: AppColors.secondaryColorLight,
    surfaceTint: AppColors.secondaryColorLight,
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
    inverseSurface: AppColors.darkGray,
    outlineVariant: AppColors.lightGrey,

    scrim: AppColors.black,
  ),
  useMaterial3: true,
);

/// Dark theme
final ThemeData darkAppTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primaryColorDark,
    onPrimaryContainer: AppColors.primaryColorDark,
    onPrimary: AppColors.white,

    primaryContainer: AppColors.white,
    secondary: AppColors.secondaryColorDark,
    onSecondary: AppColors.white,
    onSurfaceVariant: AppColors.secondaryColorDark,
    surfaceTint: AppColors.secondaryColorDark,
    onSecondaryContainer: AppColors.deepRed,
    onTertiaryContainer: AppColors.deepRed,
    onTertiary: AppColors.white,
    error: AppColors.redColor,
    onError: AppColors.black,
    onErrorContainer: AppColors.redColor,
    background: AppColors.darkGrey ,
    onBackground: AppColors.white,
    surface: AppColors.black,
    onSurface: AppColors.white,
    shadow: AppColors.white,
    inverseSurface: AppColors.darkGray,
    outlineVariant: AppColors.lightGrey,

    scrim: AppColors.white,
  ),
  useMaterial3: true,
);
