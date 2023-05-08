import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:articles/src/core/core.dart';

/// Light theme

final ThemeData lightAppTheme = ThemeData(
  primaryColor: AppColors.white,
  cardColor: AppColors.lightGrey,
  primaryColorLight: AppColors.primaryColorLight,
  primaryColorDark: AppColors.primaryColorDark,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColors.primaryColorLight, foregroundColor: Colors.white),
  colorScheme: const ColorScheme.light(
      background: AppColors.backgroundColorLight,
      error: AppColors.redColor,
      primary: AppColors.primaryColorLight,
      secondary: AppColors.secondaryColorLight),
  iconTheme: const IconThemeData(
    color: AppColors.primaryColorLight,
    size: 23,
  ),
  fontFamily: "ChakraPetch",
  tabBarTheme: TabBarTheme(
    labelStyle: AppTextStyle.bold(sizeText: SizeText.size16),
    labelColor: AppColors.primaryColorLight,
  ),
  brightness: Brightness.light,
  dialogBackgroundColor: AppColors.secondaryBackgroundColorLight,
  appBarTheme: AppBarTheme(
    // shadowColor: AppColors.lightGray,
    foregroundColor: AppColors.primaryColorLight,
    shadowColor: Colors.black,
    iconTheme: const IconThemeData(color: AppColors.primaryColorLight),
    actionsIconTheme: const IconThemeData(color: AppColors.primaryColorLight),
    backgroundColor: AppColors.backgroundColorLight,
    elevation: 2,
    toolbarTextStyle: TextTheme(
      titleLarge: AppTextStyle.bold(sizeText: SizeText.size24),
    ).bodyLarge,
    titleTextStyle: TextTheme(
      titleLarge: AppTextStyle.bold(sizeText: SizeText.size24),
    ).titleLarge,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  scaffoldBackgroundColor: AppColors.backgroundColorLight,
  textTheme: TextTheme(
    displayLarge: AppTextStyle.regular(sizeText: SizeText.size25),
    displayMedium: AppTextStyle.regular(sizeText: SizeText.size25),
    displaySmall: AppTextStyle.bold(sizeText: SizeText.size25),
    headlineMedium: AppTextStyle.regular(sizeText: SizeText.size26),
    headlineSmall: AppTextStyle.bold(sizeText: SizeText.size26),
    titleLarge: AppTextStyle.bold(sizeText: SizeText.size26),
    bodyLarge: AppTextStyle.med(sizeText: SizeText.size20),
    bodyMedium: AppTextStyle.med(sizeText: SizeText.size16).copyWith(color: AppColors.secondaryColorLight),
    titleMedium: AppTextStyle.med(sizeText: SizeText.size16).copyWith(color: AppColors.secondaryColorLight),
    titleSmall: AppTextStyle.regular(sizeText: SizeText.size12),
    headlineLarge: AppTextStyle.med(sizeText: SizeText.size20),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.backgroundColorLight,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    hintStyle: AppTextStyle.med(sizeText: SizeText.size20).copyWith(color: AppColors.lightGrey),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    fillColor: AppColors.white,
    filled: true,
    errorMaxLines: 20,
    errorStyle: AppTextStyle.med(sizeText: SizeText.size20).copyWith(color: AppColors.redColor),
    focusColor: AppColors.greenColor,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(color: AppColors.lightGrey),
  popupMenuTheme: PopupMenuThemeData(
    color: AppColors.white,
    textStyle: AppTextStyle.med(sizeText: SizeText.size20),
  ),
);

/// Dark theme
final ThemeData darkAppTheme = ThemeData(
  primaryColor: AppColors.white,
  cardColor: AppColors.darkGray,
  primaryColorLight: AppColors.primaryColorLight,
  primaryColorDark: AppColors.primaryColorDark,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColors.primaryColorDark, foregroundColor: Colors.white),
  colorScheme: const ColorScheme.light(
      background: AppColors.backgroundColorDark,
      error: AppColors.redColor,
      primary: AppColors.primaryColorDark,
      secondary: AppColors.secondaryColorDark),
  iconTheme: const IconThemeData(
    color: AppColors.primaryColorDark,
    size: 23,
  ),
  fontFamily: "ChakraPetch",
  tabBarTheme: TabBarTheme(
    labelStyle: AppTextStyle.bold(sizeText: SizeText.size16),
    labelColor: AppColors.primaryColorDark,
  ),
  brightness: Brightness.light,
  dialogBackgroundColor: AppColors.secondaryBackgroundColorDark,
  appBarTheme: AppBarTheme(
    // shadowColor: AppColors.lightGray,
    foregroundColor: AppColors.primaryColorDark,
    shadowColor: Colors.black,
    iconTheme: const IconThemeData(color: AppColors.primaryColorDark),
    actionsIconTheme: const IconThemeData(color: AppColors.primaryColorDark),
    backgroundColor: AppColors.backgroundColorDark,
    elevation: 2,
    toolbarTextStyle: TextTheme(
      titleLarge: AppTextStyle.bold(sizeText: SizeText.size24),
    ).bodyLarge,
    titleTextStyle: TextTheme(
      titleLarge: AppTextStyle.bold(sizeText: SizeText.size24),
    ).titleLarge,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  scaffoldBackgroundColor: AppColors.backgroundColorDark,
  textTheme: TextTheme(
    displayLarge: AppTextStyle.regular(sizeText: SizeText.size25),
    displayMedium: AppTextStyle.regular(sizeText: SizeText.size25),
    displaySmall: AppTextStyle.bold(sizeText: SizeText.size25),
    headlineMedium: AppTextStyle.regular(sizeText: SizeText.size26),
    headlineSmall: AppTextStyle.bold(sizeText: SizeText.size26),
    titleLarge: AppTextStyle.bold(sizeText: SizeText.size26),
    bodyLarge: AppTextStyle.med(sizeText: SizeText.size20),
    bodyMedium: AppTextStyle.med(sizeText: SizeText.size16).copyWith(color: AppColors.secondaryColorDark),
    titleMedium: AppTextStyle.med(sizeText: SizeText.size16).copyWith(color: AppColors.secondaryColorDark),
    titleSmall: AppTextStyle.regular(sizeText: SizeText.size12),
    headlineLarge: AppTextStyle.med(sizeText: SizeText.size20),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.backgroundColorDark,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    hintStyle: AppTextStyle.med(sizeText: SizeText.size20).copyWith(color: AppColors.lightGrey),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    fillColor: AppColors.white,
    // filled: widget.filled == null ? false : true,
    filled: true,
    errorMaxLines: 20,
    errorStyle: AppTextStyle.med(sizeText: SizeText.size20).copyWith(color: AppColors.redColor),
    focusColor: AppColors.greenColor,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(color: AppColors.lightGrey),
  popupMenuTheme: PopupMenuThemeData(
    color: AppColors.white,
    textStyle: AppTextStyle.med(sizeText: SizeText.size20),
  ),
);
