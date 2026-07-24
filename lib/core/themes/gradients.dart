import 'package:flutter/material.dart';

import 'colors.dart';

abstract final class AppGradients {
  AppGradients._();

  static const bkGradient = RadialGradient(
    center: Alignment(-0.8, -0.9),
    radius: 1.3,
    colors: [Color(0xFF45278B), Color(0xFF1C1B33)],
  );

  static const buttonGradient = LinearGradient(
    colors: [AppColors.secondaryColor, AppColors.primaryColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static RadialGradient glowGradient(Color color) {
    return RadialGradient(
      center: const Alignment(0, -0.2),
      radius: 0.6,
      colors: [
        color.withOpacity(.2),
        color.withOpacity(.1),
        Colors.transparent,
      ],
      stops: const [0, .35, 1],
    );
  }
}
