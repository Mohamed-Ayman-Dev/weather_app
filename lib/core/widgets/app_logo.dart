import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double? height;
  final double? width;
  final String? tag;
  final BoxFit? fit;

  const AppLogo({super.key, this.height, this.width, this.tag, this.fit});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag ?? 'logo',
      child: Image.asset(
        'assets/images/app_logo.png',
        fit: fit ?? BoxFit.cover,
        width: width ?? 200,
        height: height ?? 200,
      ),
    );
  }
}
