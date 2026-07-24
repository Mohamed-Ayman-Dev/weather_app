import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/screens/home_screen.dart';

import '../features/weather/presentation/screens/splash_screen.dart';

class Routes {
  static const initialRoute = SplashScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    SplashScreen.routeName: (_) => const SplashScreen(),
    HomeScreen.routeName: (_) => const HomeScreen(),
  };
}
