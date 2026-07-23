import 'package:flutter/material.dart';

import '../../../../core/themes/gradients.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(gradient: AppGradients.bkGradient),
      child: child,
    );
  }
}
