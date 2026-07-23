import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_constant.dart';

import 'colors.dart';

abstract class AppTextStyles {
  // Headlines
  static TextStyle headlineLarge = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w700,
    height: 1.1,
    color: AppColors.primaryColor,
    fontFamily: AppConstant.fontFamily,
  );

  static TextStyle headlineMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.labelTextColor,
    fontFamily: AppConstant.fontFamily,
  );

  static TextStyle headlineSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: AppColors.thirdColor,
    fontFamily: AppConstant.fontFamily,
  );

  // Titles
  static TextStyle titleLarge = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontFamily: AppConstant.fontFamily,
  );

  static TextStyle titleMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: AppConstant.fontFamily,
  );

  static TextStyle titleSmall = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: AppConstant.fontFamily,
  );

  // Labels
  static TextStyle labelLarge = TextStyle(
    fontFamily: AppConstant.fontFamily,
    color: Colors.white,
    fontSize: 17,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.3,
  );

  static TextStyle labelMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.moodHappyColor,
    fontFamily: AppConstant.fontFamily,
  );

  static TextStyle labelSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.labelTextColor,
    fontFamily: AppConstant.fontFamily,
  );

  // Body

  static TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.bodyTextColor,
    fontFamily: AppConstant.fontFamily,
  );

  static TextStyle bodyMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.labelTextColor,
    fontFamily: AppConstant.fontFamily,
  );

  static TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.bodyGreyTextColor,
    fontFamily: AppConstant.fontFamily,
  );
}
