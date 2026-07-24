import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/text_styles.dart';

import '../constants/app_constant.dart';
import 'colors.dart';

export 'colors.dart';
export 'gradients.dart';

abstract final class CustomTheme {
  static ThemeData darkTheme = ThemeData(
    fontFamily: AppConstant.fontFamily,
    highlightColor: AppColors.primaryColor.withOpacity(0.2),
    primaryColor: AppColors.primaryColor,
    splashColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.dark(primary: AppColors.primaryColor),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: TextTheme(
      bodySmall: AppTextStyles.bodySmall,
      bodyMedium: AppTextStyles.bodyMedium,
      titleMedium: AppTextStyles.titleMedium,
      headlineLarge: AppTextStyles.headlineLarge,
      labelSmall: AppTextStyles.labelSmall,
      titleLarge: AppTextStyles.titleLarge,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.cursorColor,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.all(AppColors.iconButtonIconColor),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.filledButtonBkColor,
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
        borderSide: const BorderSide(
          color: AppColors.focusedBorderColor,
          width: 1.6,
        ),
      ),
    ),
  );
}
