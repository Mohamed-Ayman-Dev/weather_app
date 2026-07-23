import 'package:flutter/material.dart';

import '../features/weather/presentation/screens/splash_screen.dart';

class Routes {
  static const initialRoute = SplashScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    SplashScreen.routeName: (_) => const SplashScreen(),

  };
}
