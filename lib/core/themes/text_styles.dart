import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_constant.dart';

import 'colors.dart';

abstract class AppTextStyles {
  static TextStyle bodyMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontFamily: AppConstant.fontFamily,
  );

  static TextStyle bodySmall = TextStyle(
    color: Colors.white70,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: AppConstant.fontFamily,
  );
  static TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: AppConstant.fontFamily,
  );

  static TextStyle headlineSmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.errorHeadlineColor,
    fontFamily: AppConstant.fontFamily,
  );
  static TextStyle labelSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: AppConstant.fontFamily,
  );
  static TextStyle headlineLarge = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w300,
    height: .9,
    fontSize: 56,
    fontFamily: AppConstant.fontFamily,
  );
  static TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.bodyTextColor,
    fontFamily: AppConstant.fontFamily,
  );
  static TextStyle titleMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: AppConstant.fontFamily,
  );
}
