import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/colors.dart';

abstract final class AppGradients {
  AppGradients._();

  static const RadialGradient primaryGradient = RadialGradient(
    center: Alignment(-0.8, -0.9),
    radius: 1.3,
    colors: [AppColors.secondaryColor, AppColors.primaryColor],
  );
}
