import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/text_styles.dart';

import '../constants/app_constant.dart';
import 'colors.dart';

export 'colors.dart';
export 'gradients.dart';

abstract class CustomTheme {
  static ThemeData darkTheme = ThemeData(
    fontFamily: AppConstant.fontFamily,
    highlightColor: AppColors.primaryColor.withOpacity(0.2),
    primaryColor: AppColors.primaryColor,

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.backgroundColor,
      elevation: 0,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      backgroundColor: AppColors.navBarBackgroundColor,
      selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
      unselectedIconTheme: IconThemeData(color: AppColors.backgroundColor),
    ),
    scrollbarTheme: ScrollbarThemeData(
      trackColor: WidgetStateProperty.all(AppColors.primaryColor),
      thumbColor: WidgetStateProperty.all(
        AppColors.primaryColor.withOpacity(0.7),
      ),
      trackBorderColor: WidgetStateProperty.all(AppColors.primaryColor),
    ),
    splashColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.appBarBackGroundColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: AppColors.tileTextColor,
        fontWeight: FontWeight.bold,
        fontFamily: AppConstant.fontFamily,
      ),
    ),
    listTileTheme: const ListTileThemeData(textColor: AppColors.tileTextColor),
    textTheme: TextTheme(
      bodySmall: AppTextStyles.bodySmall,
      bodyMedium: AppTextStyles.bodyMedium,
      titleMedium: AppTextStyles.titleMedium,
      headlineLarge: AppTextStyles.headlineLarge,
      labelSmall: AppTextStyles.labelSmall,
      titleLarge: AppTextStyles.titleLarge,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xFF8B8B8B),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.all(AppColors.iconButtonIconColor),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: const Color(0xFF1C1B33).withOpacity(0.5),
        foregroundColor: Colors.black,
        shape: const CircleBorder(),
        padding: EdgeInsets.zero,
        elevation: 0,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.white.withOpacity(.55), fontSize: 16),
      errorStyle: const TextStyle(
        fontSize: 13,
        color: AppColors.errorTextColor,
      ),
      filled: true,
      fillColor: Colors.white.withOpacity(.08),

      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: Colors.white.withOpacity(.3)),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: Colors.white.withOpacity(.3)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: AppColors.errorTextColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: AppColors.errorTextColor),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: Colors.white.withOpacity(.3)),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Color(0xff8DBBFF), width: 1.6),
      ),
    ),
  );
}
