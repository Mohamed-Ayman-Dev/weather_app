import 'package:flutter/material.dart';

/// All the colors used in the application are defined here
/// Update the colors as desired with their dark mode variations below them.
abstract class AppColors {
  // objects Colors
  static const Color primaryColor = Color(0xFF1C1B33);
  static const Color secondaryColor = Color(0xFF45278B);
  static const Color thirdColor = Color(0xFF999999);

  static const Color iconButtonIconColor = primaryColor;

  // background Colors
  static const Color backgroundColor = Color(0XFF12101e);
  static const Color appBarBackGroundColor = Colors.white;
  static const Color navBarBackgroundColor = Color(0xFF323539);

  // text colors
  static const Color labelTextColor = Colors.black;
  static const Color buttonTextColor = Color(0xFF1D1D1D);
  static const Color bodyGreyTextColor = Color(0xFF737373);
  static const Color bodyTextColor = Color(0xFF181818);
  static const Color tileTextColor = Color(0xFF333333);
  static const Color headlineRedTextColor = Color(0xffFFB3BE);

  static const Color errorTextColor = Color(0xFFFF0E0E);

  // border colors
  static const Color borderColor = Color(0XFF4f3c70);
  static const Color weatherCardBorderColor = Color(0XFF5936B4);

  // other colors
  static const Color dividerColor = Color(0xFFDADADA);
}
