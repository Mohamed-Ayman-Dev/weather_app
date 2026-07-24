import 'package:flutter/material.dart';

/// All the colors used in the application are defined here
abstract class AppColors {
  // Brand colors
  static const Color primaryColor = Color(0xFF1C1B33);
  static const Color secondaryColor = Color(0xFF45278B);

  // Background colors
  static const Color backgroundColor = Color(0XFF12101e);
  static Color filledButtonBkColor = Color(0xFF1C1B33).withOpacity(0.5);

  // Text colors
  static const Color bodyTextColor = Color(0xFF181818);
  static const Color errorHeadlineColor = Color(0xffFFB3BE);
  static const Color errorTextColor = Color(0xFFFF0E0E);

  // Border colors
  static const Color weatherCardBorderColor = Color(0XFF5936B4);
  static const Color focusedBorderColor = Color(0xff8DBBFF);

  // Other colors
  static const Color cursorColor = Color(0xFF8B8B8B);
  static const Color iconButtonIconColor = primaryColor;
}
