import 'package:flutter/material.dart';

final class AppShadows {
  AppShadows._();

  static final BoxShadow weatherCardShadow = BoxShadow(
    color: Colors.black.withOpacity(.30),
    blurRadius: 35,
    offset: const Offset(0, 18),
  );
}
